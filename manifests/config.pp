# Private class
class zfsonlinux::config {

  include ::zfsonlinux

  $tunables = $::zfsonlinux::tunables

  file { '/etc/modprobe.d/zfs.conf':
    ensure  => 'file',
    content => template('zfsonlinux/zfs.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
