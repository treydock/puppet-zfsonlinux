# == Class: zfsonlinux::arcstat
#
# Installs arcstat.pl
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class zfsonlinux::arcstat (
  $kstat_package_name     = $zfsonlinux::params::kstat_package_name,
  $kstat_package_source   = $zfsonlinux::params::kstat_package_source,
  $arcstat_package_name   = $zfsonlinux::params::arcstat_package_name,
  $arcstat_package_source = $zfsonlinux::params::arcstat_package_source
) inherits zfsonlinux::params {

  package { $kstat_package_name:
    ensure    => installed,
    source    => $kstat_package_source,
    provider  => rpm,
    before    => Package[$arcstat_package_name],
  }

  package { $arcstat_package_name:
    ensure    => installed,
    source    => $arcstat_package_source,
    provider  => rpm,
  }

}
