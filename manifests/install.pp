# Private class
class zfsonlinux::install {

  include ::zfsonlinux

  case $::osfamily {
    'RedHat': {
      include ::epel
      $_package_require = Yumrepo['epel']
    }
    default: {
      $_package_require = undef
    }
  }

  package { 'zfs':
    ensure  => $zfsonlinux::_package_ensure,
    name    => $::zfsonlinux::package_name,
    require => $_package_require,
  }

}
