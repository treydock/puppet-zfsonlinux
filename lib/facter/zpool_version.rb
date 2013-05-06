require 'facter'

Facter.add('zpool_version') do
  confine :kernel => "Linux"
  setcode do
    if Facter::Util::Resolution.which('dmesg')
      zpool_v = Facter::Util::Resolution.exec('dmesg | grep ZFS:')
      zpool_v_match = zpool_v.match(/ZFS pool version (\d+)./) unless zpool_v.nil?
      zpool_version = zpool_v_match.captures.first unless zpool_v_match.nil?
    end
  end
end