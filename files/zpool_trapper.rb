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
    
    opts.on('--name', 'name of zpool to monitor') do |name|
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

ZPOOL_GET = [
  'health'
]

class Zpool

  attr_accessor :raw_properties, :name

  def initialize(name = 'tank')
    self.name = name
    self.raw_properties = `zpool get all #{self.name}`
  end

  def health
    get_property_value('health')
  end

  private

  def get_property_value(p)
    if self.raw_properties[/^#{self.name}\s+#{p}\s+([^\s]+)\s+/]
      $1
    end
  end
end

@zpool = Zpool.new(@options['name'])

@time = Time.now.to_i

results = []
ZPOOL_GET.each do |key|
  results << "#{@options['hostname']} zpool.get[#{key},#{@zpool.name}] #{@time} #{@zpool.send(key)}\n"
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
