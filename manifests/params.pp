# Private class
class zfsonlinux::params {

  case $::osfamily {
    'RedHat': {
      if $::operatingsystemmajrelease >= 6 {
        $baseurl                = "http://archive.zfsonlinux.org/epel/${::operatingsystemmajrelease}/${::architecture}/"
        $source_baseurl         = "http://archive.zfsonlinux.org/epel/${::operatingsystemmajrelease}/SRPMS/"
        $testing_baseurl        = "http://archive.zfsonlinux.org/epel-testing/${::operatingsystemmajrelease}/${::architecture}/"
        $testing_source_baseurl = "http://archive.zfsonlinux.org/epel-testing/${::operatingsystemmajrelease}/SRPMS/"
        $package_name           = 'zfs'
        $service_name           = 'zfs'
        $service_hasstatus      = false
        $service_hasrestart     = true
        $service_status         = 'lsmod | egrep -q "^zfs"'
      } else {
        fail("Unsupported operatingsystemmajrelease: ${::operatingsystemmajrelease}, module ${module_name} only supports 6.x")
      }
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only supports osfamily RedHat")
    }
  }

}
