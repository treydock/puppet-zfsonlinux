# Private class
class zfsonlinux::install {

  include ::zfsonlinux

  package { 'zfs':
    ensure => 'present',
    name   => $::zfsonlinux::package_name,
  }

}
