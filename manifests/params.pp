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
      $zfs_package_name     = 'zfs'
      $zfs_service_name     = 'zfs'
      $package_dependencies = [
        'kernel-devel',
        'gcc',
        'make',
        'perl',
      ]

      case $::operatingsystem {
        /Scientific/: {
          $repo_class       = 'zfsonlinux::repo::sl'
        }

        default: {
          $repo_class       = 'zfsonlinux::repo::el'
          $repo_source_url  = 'http://archive.zfsonlinux.org/epel/zfs-release-1-2.el6.noarch.rpm'
        }
      }
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only supports osfamily RedHat")
    }
  }

}
