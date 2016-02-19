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

  if $::zfsonlinux::install_devel_package {
    package { 'libzfs2-devel':
      ensure  => $::zfsonlinux::_devel_package_ensure,
      name    => $::zfsonlinux::devel_package_name,
      require => Package['zfs'],
    }
  }

}
