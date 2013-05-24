#!/usr/bin/env ruby

require 'pp'
require 'optparse'
require 'singleton'
require 'fileutils'
require 'yaml'
require 'date'

DEFAULT_OPTIONS = {
  'dev_path' => '/dev/disk/by-path',
  'vdev_prefix' => 'd',
  'exclude' => 'partitioned',
  'output' => false,
  'verbose' => true,
  'debug' => false,
}

EXCLUDE_META_PARAMETERS = [
  'partitioned',
]

class File
  def self.equals_string?(file, str)
    return false unless File.exists?(file)
    contents = File.open(file, 'rb') { |f| f.read }
    return true if contents == str
    return false
  end
end

# Idea pulled from http://www.stelfox.net/blog/2012/12/02/rubys-option-parser-a-more-complete-example/
module CLI
  # Defines the available configuration options for the configuration
  ConfigurationStruct = Struct.new('ConfigurationStruct', *DEFAULT_OPTIONS.keys)

  class Configuration
    include Singleton

    # Initialize the configuration and set defaults:
    @@config = ConfigurationStruct.new
    @@config.members.each { |m| @@config.send("#{m}=", DEFAULT_OPTIONS[m]) }

    def self.config
      yield(@@config) if block_given?
      @@config
    end

    # Loads a YAML configuration file and sets each of the configuration values to
    # whats in the file.
    def self.load(file)
      YAML::load_file(file).each do |key, value|
        self.send("#{key}=", value)
      end
    end

    # This provides an easy way to dump the configuration as a hash
    def self.to_hash
      Hash[@@config.each_pair.to_a]
    end

    # Pass any other calls (most likely attribute setters/getters on to the
    # configuration as a way to easily set/get attribute values
    def self.method_missing(method, *args, &block)
      if @@config.respond_to?(method)
        @@config.send(method, *args, &block)
      else
        raise NoMethodError
      end
    end

    # Handles validating the configuration that has been loaded/configured
    def self.validate!
      valid = true

      valid = false if Configuration.dev_path.nil?
      valid = false if Configuration.vdev_prefix.nil?

      raise ArgumentError unless valid
    end
  end

  class ConfigurationParser
    def self.parse(args)
      explanation = ""

      opts = OptionParser.new do |parser|
        parser.banner = "Usage: #{__FILE__} [options]"

        parser.separator ""
        parser.separator "Specific options:"

        parser.on('-d', '--dev-path STR', String, 'the path to scan for block devices') do |dev_path|
          Configuration.dev_path = dev_path
        end

        parser.on('-p', '--vdev-prefix STR', String, 'the prefix for vdev names') do |vdev_prefix|
          Configuration.vdev_prefix = vdev_prefix
        end

        parser.on('-e', '--exclude dev1,dev2,dev3', Array, 'List of excluded block devices') do |exclude|
          Configuration.exclude = exclude
        end

        parser.on('-o', '--output STR', String, 'the path to write vdev output', "Default: #{Configuration.output}") do |output|
          Configuration.output = output
        end

        parser.on_tail('--verbose', TrueClass, 'enable verbose output', "Default: #{Configuration.verbose}") do
          Configuration.verbose = true
        end

        parser.on_tail('--debug', TrueClass, 'enable debug output', "Default: #{Configuration.debug}") do
          Configuration.debug = true
        end

        parser.on_tail('-h', '--help', 'Display this screen') do
          puts parser
          print "\n", explanation
          exit
        end

        explanation = <<-EOE
OPTIONS:

  -d, --dev-path STR
    The path to look for block devices
    Default: #{Configuration.dev_path}

  -p, --vdev-prefix STR
    The prefix used in vdev names
    Default: #{Configuration.vdev_prefix}

  -e, --exclude dev1,dev2,dev3
    A list of devices to exclude from vdev aliases.
    Accepts a block device such as 'sda' or meta-parameters.
    Meta-parameters: #{EXCLUDE_META_PARAMETERS.join(',')}
    Default: #{Configuration.exclude}

EOE
      end

      begin
        opts.parse!(args)
        CLI::Configuration.validate!
      rescue OptionParser::InvalidOption, OptionParser::MissingArgument, OptionParser::InvalidArgument
        puts $!.to_s
        puts opts
        print "\n", explanation
        exit
      end
    end
  end
end

config_file = File.join(File.dirname(__FILE__), 'config.yaml')
if File.exists?(config_file)
  CLI::Configuration.load(config_file)
end

CLI::ConfigurationParser.parse(ARGV)
#CLI::Configuration.validate!

def debug_output(msg = "", object = nil)
  return unless CLI::Configuration.debug
  puts "DEBUG: #{msg}"
  pp object
end

#devices = []

=begin
partitions = []
# Get all partitions on system
IO.readlines('/proc/partitions').each do |line|
  line.strip!
  # Skip the header
  # Assumes all valid block device lines begin with a number
  next unless line =~ /^[0-9].*$/
  # All whitespaces to single space and split on space
  columns = line.gsub!(/\s+/m, ' ').split(" ")

  # Match only block devices, not partitions
  if columns[3] =~ /^[a-z]+$/
    partitions << columns[3]
  end
end
=end

## Get lsblk devices ##
output = IO.popen("/bin/lsblk --noheadings --output name,type --raw") { |f| f.readlines.map(&:strip) }
blks = output.collect do |line|
  values = line.split(" ")
  {
    :name => values[0],
    :type => values[1],
  }
end

debug_output("Devices in lsblk:\n", blks)

## Begin filtering out non disk devices ##
devices = blks.select do |blk|
  blk[:type] =~ /disk/
end

# Remove paritioned disks from device Array
if CLI::Configuration.exclude.include?('partitioned')
  devices.delete_if do |dev|
    output = IO.popen("/bin/lsblk --noheadings --output name,type --raw /dev/#{dev[:name]}") do |f|
      f.readlines.map(&:strip).map{ |l| {:name => l.split(" ")[0], :type => l.split(" ")[1]} }
    end

    output.any? {|dev| dev[:type] =~ /part/}
    output.size > 1
  end
end

# Remove explicitly excluded devices
devices.delete_if do |dev|
  CLI::Configuration.exclude.include?(dev[:name])
end

debug_output("Devices after filtering:\n", devices)

# Get all devices in the dev path
Dir.glob(File.join(CLI::Configuration.dev_path, '*')).each do |path|
  target = File.readlink(path)
  disk = File.basename(target)

  # Skip disks not in devices list
  next unless devices.any? { |d| d[:name] == disk }

  # Get each element from the devices array by index
  device_id = devices.index { |d| d[:name] == disk }

  # Add the dev path to device Hash
  devices[device_id][:path] = path
end

debug_output("Devices in dev path: #{CLI::Configuration.dev_path}\n", devices)

# This is in case the devices Array contains a Hash with no path
if devices.any? {|d| d[:path].nil? or d[:path] == ''}
  puts "Some devices not found in #{CLI::Configuration.dev_path}"
  pp devices
  exit 1
end

# Sort the devices by their name
devices.sort! { |x, y| x[:name] <=> y[:name] }

debug_output("sorted Hash of devices: \n", devices)

# Generate the vdev names based on the now ordered array of devices
devices.each_with_index do |dev, index|
  dev_number = sprintf '%02d', index + 1
  dev[:vdev_name] = "#{CLI::Configuration.vdev_prefix}#{dev_number}"
end

debug_output("device Hash with vdev names: \n", devices)

# Create vdev_id.conf
# Format: alias <vdev_name> <path>
aliases = []
devices.each do |dev|
  line = "alias #{dev[:vdev_name]} #{dev[:path]}"
  aliases << line
end

# Write output either to file or STDOUT
if file = CLI::Configuration.output
  # Check for existance of the file we are writing to
  if File.exists?(file)
    # Get existing files content
    content = IO.readlines(file).map(&:chomp)
    # If the output file does not match the new output
    # then a backup is created
    if not content.eql?(aliases)
      backup_file = file + '.' + Date.today.to_s.gsub('-', '')
      FileUtils.copy(file, backup_file, :verbose => CLI::Configuration.verbose)
    end
  end

  # write the alias output to appropriate file
  File.open(CLI::Configuration.output, 'w') { |f| f.puts(aliases) }
else
  # to STDOUT
  puts aliases
end

exit 0