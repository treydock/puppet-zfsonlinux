include zfsonlinux

exec { 'mk_vdev_alias.rb':
  path    => '/usr/bin:/usr/sbin:/bin:/sbin',
  command => '/etc/puppet/modules/zfsonlinux/files/mk_vdev_alias.rb --exclude=sda --output /etc/zfs/vdev_id.conf',
  creates => '/etc/zfs/vdev_id.conf',
  notify  => Exec['udevadm trigger']
}

exec { 'udevadm trigger':
  path        => '/usr/bin:/usr/sbin:/bin:/sbin',
  command     => 'udevadm trigger',
  creates     => '/dev/disk/by-vdev',
  refreshonly => true,
}

Package['zfs'] -> Exec['mk_vdev_alias.rb']
