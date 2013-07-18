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
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only supports osfamily RedHat")
    }
  }

}
