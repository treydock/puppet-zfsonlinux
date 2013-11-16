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

  $os_maj_version = $::os_maj_version ? {
    undef   => inline_template('<%= scope.lookupvar(\'::operatingsystemrelease\').split(\'.\').first %>'),
    default => $::os_maj_version,
  }

  case $::osfamily {
    'RedHat': {
      $zfs_baseurl            = "http://archive.zfsonlinux.org/epel/${os_maj_version}/${::architecture}/"
      $zfs_source_baseurl     = "http://archive.zfsonlinux.org/epel/${os_maj_version}/SRPMS/"
      $zfs_package_name       = 'zfs'
      $zfs_service_name       = 'zfs'
      $zfs_service_hasstatus  = false
      $zfs_service_hasrestart = true
      $zfs_service_status     = 'lsmod | egrep -q "^zfs"'
      $package_dependencies   = [
        'kernel-devel',
        'gcc',
        'make',
        'perl',
      ]
      $package_require        = [Yumrepo['zfs'], Package[$package_dependencies]]

      case $os_maj_version {
        '5': {
          fail("Unsupported operatingsystemrelease: ${::operatingsystemrelease}, module ${module_name} only supports >= 6.0")
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
