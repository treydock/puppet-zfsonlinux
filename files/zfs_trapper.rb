#!/usr/bin/env ruby

require 'rubygems'
require 'optparse'
require 'logger'
require 'pp'

def parse(args)
  @options = {}
  @options['name'] = "tank"
  @options['hostname'] = `hostname -f`.strip
  @options['server'] = IO.read('/etc/zabbix_agentd.conf').scan(/^Server=(.*)$/).flatten.first.split(',').first

  optparse = OptionParser.new do |opts|
    
    opts.on('--name', 'name of zfs filesystem to monitor') do |name|
      @options['name'] = name
    end

    opts.on('--hostname', 'hostname in Zabbix') do |hostname|
      @options['hostname'] = hostname
    end

    opts.on('--server', 'Zabbix Server to send trapper data') do |server|
      @options['server'] = server
    end

    opts.on('-h', '--help', 'Display this screen') do
      puts opts
      exit
    end
  end
  
  begin
    optparse.parse!(args)
  rescue OptionParser::InvalidOption, OptionParser::MissingArgument
    puts $!.to_s
    puts optparse
    exit
  end

  @options

end

@options = parse(ARGV)

log = Logger.new(STDOUT)
log.level = Logger::INFO
log.datetime_format = "%Y-%m-%d %H:%M:%S"
log.formatter = proc do |severtiy, datetime, progname, msg|
  "#{datetime.strftime(log.datetime_format)}: #{msg}\n"
end

ZABBIX_SEND_DATAFILE = "/tmp/#{File.basename(__FILE__, '.*')}.txt"
ZFS_GET = [
  'available',
  'used',
  'total',
  'p_available',
]

class ZFS

  attr_accessor :raw_properties, :name

  def initialize(name = 'tank')
    self.name = name
    self.raw_properties = `zfs get -H -p all #{self.name}`
  end

  def used
    value = get_property_value('used')
    value.to_i unless value.nil?
  end

  def available
    value = get_property_value('available')
    value.to_i unless value.nil?
  end

  def total
    available + used unless used.nil? or available.nil?
  end

  def p_available
    100 * (available.to_f / total.to_f) unless available.nil? or total.nil?
  end

  private

  def get_property_value(p)
    if self.raw_properties[/^#{self.name}\s+#{p}\s+([^\s]+)\s+/]
      $1
    end
  end
end

@zfs = ZFS.new(@options['name'])

@time = Time.now.to_i

results = []
ZFS_GET.each do |key|
  results << "#{@options['hostname']} zfs.get[#{key},#{@zfs.name}] #{@time} #{@zfs.send(key)}\n"
end

File.open(ZABBIX_SEND_DATAFILE, "w") { |f| f.write(results) }

log.info("Zabbix send datafile:\n#{File.read(ZABBIX_SEND_DATAFILE)}")

sender_cmd = "zabbix_sender -z #{@options['server']} -p 10051 -T -i #{ZABBIX_SEND_DATAFILE}"
log.info("Executing: #{sender_cmd}")
sender_output = `#{sender_cmd}`
exit_status = $?.to_s
log.info("Zabbix sender output:\n#{sender_output}")
log.info("Exit code: #{exit_status}")

exit 0
