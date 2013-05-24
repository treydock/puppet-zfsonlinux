# == Class: zpool
#
# Creates a zpool.  Used for testing purposes only.
#
# === Parameters
#
# [*destroy*]
#   If true, the zpool 'tank' will be destroyed before being created.
#   Default:  false,
#
# [*type*]
#   Sets the fault tolerance of the zpool.
#   Valid values are 'raidz2' and 'mirror'.
#   Default:  raidz2,
#
# === Examples
#
#  class { 'zpool': }
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class zpool (
  $destroy  = false,
  $type     = 'raidz2'
) {

  validate_re($type, '^(raidz2|mirror)$')

  if $destroy {
    exec { 'destroy tank':
      path    => '/usr/bin:/usr/sbin:/bin:/sbin',
      command => '/sbin/zpool destroy tank',
      onlyif  => '/sbin/zpool status tank 2>/dev/null',
      before  => Zpool['tank'],
    }
  }

  case $type {
    'raidz2' : {
      zpool { 'tank':
        ensure      => present,
        raidz       => [ 'd01 d02 d03 d04', 'd05 d06 d07 d08' ],
        raid_parity => 'raidz2',
        pool        => 'tank',
        log_mirror  => 'd09 d10',
        force       => true,
      }
    }

    'mirror' : {
      zpool { 'tank':
        ensure      => present,
        mirror      => [ 'd01 d02', 'd03 d04', 'd05 d06', 'd07 d08' ],
        pool        => 'tank',
        log_mirror  => 'd09 d10',
        force       => true,
      }
    }

    default : {
      fail("Invalid 'type': ${type}.  Valid values are 'raidz2' or 'mirror'")
    }
  }
}
