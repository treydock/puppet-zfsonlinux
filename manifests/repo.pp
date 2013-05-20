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

  include zfsonlinux::params

  $repo_class = $zfsonlinux::params::repo_class

  require $repo_class

}
