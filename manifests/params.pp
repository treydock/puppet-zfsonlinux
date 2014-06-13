# Class: zfsonlinux::params
#
#   The zfsonlinux configuration settings.
#
# === Variables
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class zfsonlinux::params {

  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease {
        '6': {
          $baseurl                = "http://archive.zfsonlinux.org/epel/${::operatingsystemmajrelease}/${::architecture}/"
          $source_baseurl         = "http://archive.zfsonlinux.org/epel/${::operatingsystemmajrelease}/SRPMS/"
          $testing_baseurl        = "http://archive.zfsonlinux.org/epel-testing/${::operatingsystemmajrelease}/${::architecture}/"
          $testing_source_baseurl = "http://archive.zfsonlinux.org/epel-testing/${::operatingsystemmajrelease}/SRPMS/"
          $package_name           = 'zfs'
          $service_name           = 'zfs'
          $service_hasstatus      = false
          $service_hasrestart     = true
          $service_status         = 'lsmod | egrep -q "^zfs"'
        }

        default: {
          fail("Unsupported operatingsystemmajrelease: ${::operatingsystemmajrelease}, module ${module_name} only supports 6.x")
        }
      }
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only supports osfamily RedHat")
    }
  }

}
