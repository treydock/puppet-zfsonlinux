Puppet::Type.type(:zpool).provide(:zpool) do
  desc "Provider for zpool."

  commands :zpool => 'zpool'

  #NAME    SIZE  ALLOC   FREE    CAP  HEALTH  ALTROOT
  def self.instances
    zpool(:list, '-H').split("\n").collect do |line|
      name, size, alloc, free, cap, health, altroot = line.split(/\s+/)
      new({:name => name, :ensure => :present})
    end
  end

  def process_zpool_data(pool_array)
    if pool_array == []
      return Hash.new(:absent)
    end
    #get the name and get rid of it
    pool = Hash.new
    pool[:pool] = pool_array[0]
    pool_array.shift

    tmp = []
    #order matters here :(
    pool_array.reverse.each_with_index do |value, index|
      sym = nil
      case value
      when "spares";
        sym = :spare 
      when "logs_mirror";
        sym = :log_mirror
      when "logs";
        sym = :log
      when "cache";
        sym = :cache
      when /^mirror|^raidz1|^raidz2/;
        sym = value =~ /^mirror/ ? :mirror : :raidz
        pool[:raid_parity] = "raidz2" if value =~ /^raidz2/
      else
        tmp << value
        sym = :disk if value == pool_array.first
      end

      if sym
        pool[sym] = pool[sym] ? pool[sym].unshift(tmp.reverse.join(' ')) : [tmp.reverse.join(' ')]
        tmp.clear
      end
    end
    pool
  end

  def get_pool_data
    # http://docs.oracle.com/cd/E19082-01/817-2271/gbcve/index.html
    # we could also use zpool iostat -v mypool for a (little bit) cleaner output
    out = execute("zpool status #{@resource[:pool]}", :failonfail => false, :combine => false)
    zpool_data = out.lines.select { |line| line.index("\t") == 0 }.collect { |l| l.strip.split("\s")[0] }
    zpool_data.shift
    if log_index = zpool_data.index("logs") and zpool_data.at(log_index+1) =~ /^mirror/
      zpool_data.delete_at(log_index+1)
      zpool_data[log_index] = "logs_mirror"
    end
    zpool_data
  end

  def current_pool
    @current_pool = process_zpool_data(get_pool_data) unless (defined?(@current_pool) and @current_pool)
    @current_pool
  end

  def flush
    @current_pool= nil
  end

  def force
    @resource[:force] ? "-f" : ""
  end

  #Adds log, cache and spare
  def build_named(name)
    if prop = @resource[name.intern]
      [name] + prop.collect { |p| p.split(' ') }.flatten
    else
      []
    end
  end

  def build_log_mirror
    if log_mirror = @resource[:log_mirror]
      ["log"] + ["mirror"] + log_mirror
    else
      []
    end
  end

  #query for parity and set the right string
  def raidzarity
    @resource[:raid_parity] ? @resource[:raid_parity] : "raidz1"
  end

  #builds up the vdevs for create command
  def build_vdevs
    if disk = @resource[:disk]
      disk.collect { |d| d.split(' ') }.flatten
    elsif mirror = @resource[:mirror]
      mirror.map { |m| ["mirror"] +  [m] }
    elsif raidz = @resource[:raidz]
      raidz.map { |r| [raidzarity] + [r] }
    end
  end

  def create
    zpool(*([:create, force, @resource[:pool]] + build_vdevs + build_log_mirror + build_named("spare") + build_named("log") + build_named("cache")))
  end

  def destroy
    zpool :destroy, @resource[:pool]
  end

  def exists?
    if current_pool[:pool] == :absent
      false
    else
      true
    end
  end

  [:disk, :mirror, :raidz, :log, :log_mirror, :cache, :spare].each do |field|
    define_method(field) do
      Puppet.debug("#{field} -> #{current_pool[field]}")
      current_pool[field]
    end

    define_method(field.to_s + "=") do |should|
      self.fail "zpool #{field} can't be changed. should be #{should}, currently is #{current_pool[field]}"
    end
  end

end

