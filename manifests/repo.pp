# == Class: zfsonlinux::repo
#
# Adds zfsonlinux repo class based on OS type.
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class zfsonlinux::repo {

  case $::osfamily {
    'RedHat': { include zfsonlinux::repo::el }
    default: {}
  }
}
