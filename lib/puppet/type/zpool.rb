module Puppet
  class Property

    class VDev < Property

      def flatten_and_sort(array)
        array = [array] unless array.is_a? Array
        array.collect { |a| a.split(' ') }.flatten.sort
      end

      def insync?(is)
        return @should == [:absent] if is == :absent

        flatten_and_sort(is) == flatten_and_sort(@should)
      end
    end

    class MultiVDev < VDev
      def insync?(is)
        return @should == [:absent] if is == :absent

        return false unless is.length == @should.length

        is.each_with_index { |list, i| return false unless flatten_and_sort(list) == flatten_and_sort(@should[i]) }

        #if we made it this far we are in sync
        true
      end
    end
  end

  newtype(:zpool) do
    @doc = "Manage zpools. Create and delete zpools. The provider WILL NOT SYNC, only report differences.

      Supports vdevs with mirrors, raidz, logs, cache and spares."

    ensurable

    newproperty(:disk, :array_matching => :all, :parent => Puppet::Property::VDev) do
      desc "The disk(s) for this pool. Can be an array or a space separated string."
    end

    newproperty(:mirror, :array_matching => :all, :parent => Puppet::Property::MultiVDev) do
      desc "List of all the devices to mirror for this pool. Each mirror should be a
      space separated string:

          mirror => [\"disk1 disk2\", \"disk3 disk4\"],

      "

      validate do |value|
        raise ArgumentError, "mirror names must be provided as string separated, not a comma-separated list" if value.include?(",")
      end
    end

    newproperty(:raidz, :array_matching => :all, :parent => Puppet::Property::MultiVDev) do
      desc "List of all the devices to raid for this pool. Should be an array of
      space separated strings:

          raidz => [\"disk1 disk2\", \"disk3 disk4\"],

      "

      validate do |value|
        raise ArgumentError, "raid names must be provided as string separated, not a comma-separated list" if value.include?(",")
      end
    end

    newproperty(:spare, :array_matching => :all, :parent => Puppet::Property::VDev) do
      desc "Spare disk(s) for this pool."
    end

    newproperty(:log, :array_matching => :all, :parent => Puppet::Property::VDev) do
      desc "Log disks for this pool. This type does not currently support mirroring of log disks."
    end

    newproperty(:log_mirror, :array_matching => :all, :parent => Puppet::Property::MultiVDev) do
      desc "Log disks for this pool that will be mirrored.  Should be a space seperated string
      or an Array:
      
          log_mirror => [\"disk1\", \"disk2\"],
          
          log_mirror => \"disk1 disk2\",
      "
      
      validate do |value|
        if value.include?(",") # or not value.is_a?(Array)
          raise ArgumentError, "log_mirror names must be provided as string separated, not a comma-separated list, or an Array."
        end
      end
    end

    newproperty(:cache, :array_matching => :all, :parent => Puppet::Property::VDev) do
      desc "Cache disks for this pool."
    end

    newparam(:pool) do
      desc "The name for this pool."
      isnamevar
    end

    newparam(:raid_parity) do
      desc "Determines parity when using the `raidz` parameter."
    end

    newparam(:force, :boolean => true) do
      desc "Determines if the zpool create command will force use of devices without an EFI label"

      defaultto false
    end

    validate do
      has_should = [:disk, :mirror, :raidz].select { |prop| self.should(prop) }
      self.fail "You cannot specify #{has_should.join(" and ")} on this type (only one)" if has_should.length > 1
    end
  end
end
