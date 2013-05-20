# == Class: zfsonlinux::repo::el
#
# Adds the zfsonlinux repo to Enterprise Linux systems.
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class zfsonlinux::repo::el {

  include zfsonlinux::params

  $repo_source_url = $zfsonlinux::params::repo_source_url

  package { 'zfs-release':
    ensure    => 'installed',
    source    => $repo_source_url,
    provider  => 'rpm',
  }

}
