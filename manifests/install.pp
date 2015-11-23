# Private class
class zfsonlinux::install {

  include ::zfsonlinux

  package { 'zfs':
    ensure => $zfsonlinux::_package_ensure,
    name   => $::zfsonlinux::package_name,
  }

}
