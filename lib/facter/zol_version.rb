# zol_version.rb

Facter.add(:zol_version) do
  confine :osfamily => "RedHat"

  if zfs_v_match = Facter::Util::Resolution.exec("rpm -q --queryformat '%{NAME}-%{VERSION}' zfs").match(/^zfs-(.*)$/)
    setcode do
      zfs_v = zfs_v_match[1]
      zfs_v
    end
  end
end
