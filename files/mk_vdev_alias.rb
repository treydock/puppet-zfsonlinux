#!/usr/bin/env ruby

require 'pp'
require 'optparse'

def parse(args)
  @options = {}
  @options['dev_path'] = '/dev/disk/by-path'
  @options['vdev_prefix'] = 'd'
  @options['exclude'] = []
  @options['debug'] = false

  OptionParser.new do |opts|
    opts.banner = "Usage: #{File.basename(__FILE__)} [options]"
    
    opts.separator ""
    opts.separator "Specific options:"

    opts.on('-d', '--dev-path PATH', 'The device path to use in vdev aliases.',
            "  Default: #{@options['dev_path']}") do |dev_path|
      @options['dev_path'] = dev_path
    end

    opts.on('-p', '--vdev-prefix PREFIX', 'The prefix for vdev names.',
            "  Default: #{@options['vdev_prefix']}") do |vdev_prefix|
      @options['vdev_prefix'] = vdev_prefix
    end

    opts.on('-e', '--exclude sda,sdb', Array, 'List of excluded block devices.',
            "  Accepts a block device such as 'sda'.",
            "  Default: #{@options['exclude'].join(',')}") do |exclude|
      @options['exclude'] = exclude
    end

    opts.on('--[no-]debug', 'Enable debug output.',
            "  Default: #{@options['debug']}") do |debug|
      @options['debug'] = debug
    end

    opts.on('-h', '--help', 'Display this screen.') do
      puts opts
      exit
    end

    begin
      opts.parse!(args)
    rescue OptionParser::InvalidOption, OptionParser::MissingArgument
      puts $!.to_s
      puts opts
      exit
    end
  end
  @options
end

def debug_output(msg = "", object = nil, opt = {})
  return unless opt['debug']
  puts "DEBUG: #{msg}"
  pp object
end

options = parse(ARGV)
debug_output("Options:\n", options, options)

## Get lsblk devices ##
output = IO.popen("/bin/lsblk --noheadings --output name,type --raw --nodeps") { |f| f.readlines.map(&:strip) }
blks = output.collect do |line|
  values = line.split(" ")
  {
    :name => values[0],
    :type => values[1],
  }
end

debug_output("Devices in lsblk:\n", blks, options)

## Filter out non disk devices ##
devices = blks.select do |blk|
  blk[:type] == 'disk'
end

# Remove explicitly excluded devices
devices.delete_if do |dev|
  options['exclude'].include?(dev[:name])
end

debug_output("Devices after filtering:\n", devices, options)

# Get all devices in the dev path
Dir.glob(File.join(options['dev_path'], '*')).each do |path|
  target = File.readlink(path)
  disk = File.basename(target)

  # Skip disks not in devices list
  next unless devices.any? { |d| d[:name] == disk }

  # Get each element from the devices array by index
  device_id = devices.index { |d| d[:name] == disk }

  # Add the dev path to device Hash
  devices[device_id][:path] = path
end

debug_output("Devices in dev path: #{options['dev_path']}\n", devices, options)

# This is in case the devices Array contains a Hash with no path
if devices.any? {|d| d[:path].nil? or d[:path] == ''}
  puts "Some devices not found in #{options['dev_path']}"
  pp devices
  exit 1
end

# Sort the devices by their name
devices.sort! { |x, y| x[:name] <=> y[:name] }

debug_output("sorted Hash of devices: \n", devices, options)

# Generate the vdev names based on the now ordered array of devices
devices.each_with_index do |dev, index|
  dev_number = sprintf '%02d', index + 1
  dev[:vdev_name] = "#{options['vdev_prefix']}#{dev_number}"
end

debug_output("device Hash with vdev names: \n", devices, options)

# Create vdev_id.conf
# Format: alias <vdev_name> <path>
aliases = []
devices.each do |dev|
  line = "alias #{dev[:vdev_name]} #{dev[:path]}"
  aliases << line
end

puts aliases

exit 0
