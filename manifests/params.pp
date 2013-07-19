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
      $zfs_baseurl            = "http://archive.zfsonlinux.org/epel/${::os_maj_version}/${::architecture}/"
      $zfs_source_baseurl     = "http://archive.zfsonlinux.org/epel/${::os_maj_version}/SRPMS/"
      $package_require        = Yumrepo['zfs']
      $zfs_package_name       = 'zfs'
      $zfs_service_name       = 'zfs'
      $zfs_service_hasstatus  = true
      $zfs_service_hasrestart = true
      $package_dependencies   = [
        'kernel-devel',
        'gcc',
        'make',
        'perl',
      ]

      case $::os_maj_version {
        '5': {
          $yum_priorities_package = 'yum-priorities'
        }
        default: {
          $yum_priorities_package = 'yum-plugin-priorities'
        }
      }
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only supports osfamily RedHat")
    }
  }

}
