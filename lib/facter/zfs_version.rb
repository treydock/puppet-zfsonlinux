require 'facter'

Facter.add('zfs_version') do
  confine :kernel => "Linux"
  setcode do
    if Facter::Util::Resolution.which('dmesg')
      zfs_v = Facter::Util::Resolution.exec('dmesg | grep ZFS:')
      zfs_v_match = zfs_v.match(/ZFS filesystem version (\d+)./) unless zfs_v.nil?
      zfs_version = zfs_v_match.captures.first unless zfs_v_match.nil?
    end
  end
end