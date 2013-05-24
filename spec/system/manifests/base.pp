host { 'puppet':
  ip => '127.0.0.1',
}->
package { 'puppetlabs-release':
  ensure    => installed,
  source    => 'http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm',
  provider  => 'rpm',
}->
package { 'puppet':
  ensure  => installed,
}->
file { '/etc/puppet/hiera.yaml':
  ensure  => present,
  content => '---
:logger: noop',
}->
exec { 'puppet module install puppetlabs-stdlib':
  path    => '/usr/bin:/usr/sbin:/bin:/sbin',
  command => 'puppet module install puppetlabs-stdlib --modulepath /etc/puppet/modules',
  creates => '/etc/puppet/modules/stdlib',
}->
exec { 'mk_vdev_alias.rb':
  path    => '/usr/bin:/usr/sbin:/bin:/sbin',
  command => '/etc/puppet/modules/zfsonlinux/files/mk_vdev_alias.rb --exclude=sda --output /etc/zfs/vdev_id.conf',
  creates => '/etc/zfs/vdev_id.conf',
}->
exec { 'udevadm trigger':
path    => '/usr/bin:/usr/sbin:/bin:/sbin',
command => 'udevadm trigger',
creates => '/dev/disk/by-vdev',
}->
class { 'zfsonlinux': }