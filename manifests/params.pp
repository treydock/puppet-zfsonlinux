# Private class
class zfsonlinux::params {

  if $::zol_version {
    $version = $::zol_version
  } else {
    $version = '0.6.5.3'
  }

  case $::osfamily {
    'RedHat': {
      if versioncmp($::operatingsystemmajrelease, '6') >= 0 {
        $release_url            = "http://archive.zfsonlinux.org/epel/zfs-release.el${::operatingsystemmajrelease}.noarch.rpm"
        $baseurl                = "http://archive.zfsonlinux.org/epel/${::operatingsystemmajrelease}/${::architecture}/"
        $source_baseurl         = "http://archive.zfsonlinux.org/epel/${::operatingsystemmajrelease}/SRPMS/"
        $testing_baseurl        = "http://archive.zfsonlinux.org/epel-testing/${::operatingsystemmajrelease}/${::architecture}/"
        $testing_source_baseurl = "http://archive.zfsonlinux.org/epel-testing/${::operatingsystemmajrelease}/SRPMS/"
        $package_name           = 'zfs'
        $devel_package_name     = 'libzfs2-devel'
        $service_name           = 'zfs'
        $service_hasstatus      = false
        $service_hasrestart     = true
        $service_status         = 'lsmod | egrep -q "^zfs"'
        $service_config_path    = '/etc/sysconfig/zfs'
      } else {
        fail("Unsupported operatingsystemmajrelease: ${::operatingsystemmajrelease}, module ${module_name} only supports 6.x or greater")
      }
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only supports osfamily RedHat")
    }
  }

}
