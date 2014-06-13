# == Class: zfsonlinux::install
#
# private class
#
class zfsonlinux::install {

  include ::zfsonlinux

  package { 'zfs':
    ensure  => $::zfsonlinux::package_ensure,
    name    => $::zfsonlinux::package_name,
  }

}
