# puppet-zfsonlinux

[![Build Status](https://travis-ci.org/treydock/puppet-zfsonlinux.png)](https://travis-ci.org/treydock/puppet-zfsonlinux)

####Table of Contents

1. [Overview](#overview)
    * [ZFS Compatibility](#zfs-compatibility)
    * [ZED - ZFS Event Daemon information](#zed)
2. [Usage - Configuration options](#usage)
3. [Reference - Parameter and detailed reference to all options](#reference)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)
6. [TODO](#todo)
7. [Additional Information](#additional-information)

## Overview

This module is intended to streamlines the installation and configuration of ZFS on Linux.

### ZFS Compatibility

ZFS on Linux Versions     | <= 0.6.2 |  0.6.3  | > 0.6.3 |
:-------------------------|:--------:|:-------:|:-------:
**puppet-zfsonlinux 0.x** | **yes**  | no      | no      
**puppet-zfsonlinux 1.x** | no       | **yes** | **unknown** 

### ZED

This module now supports management of the ZED configuration options.  All the default values are set to be the defaults used if all the options in 'zed.rc' were commented out.

ZED emails are disabled by ensuring 'ZED_EMAIL' is absent, unless `zed_email` has a value other than 'UNSET'.

The 'ZED\_SPARE\_ON\_IO\_ERRORS' and 'ZED\_SPARE\_ON\_CHECKSUM\_ERRORS' options are set to '0' by default which disables the hot sparing functionality for those events.

For details regarding ZED refer to these commits:

* https://github.com/zfsonlinux/zfs/commit/9e246ac3d8ef9ff8aed86ecf277eea2cae3a79d3
* https://github.com/zfsonlinux/zfs/commit/904ea2763e6576f6971be4a684e6765aaea5221

## Usage

### zfsonlinux

The default behavior ensures the following:

* repositories are configured
* ZFS package installed
* ZFS module parameters are set (if defined using 'tunables' parameter)
* ZED options are set
* ZFS service is started and enabled

Example:

    class { 'zfsonlinux': }

ZFS kernel module options can be set using the `tunables` parameter.
This example sets the 'zfs\_arc\_max' to 240457728

    class { 'zfsonlinux':
      tunables  => { 'zfs_arc_max' => '240457728' },
    }

Configure the ZED to send emails to root and to send emails regardless of pool health.

    class { 'zfsonlinux':
      zed_email         => 'root',
      zed_email_verbose => '1',
    }

Configure the ZED to replace a drive with a hot spare after 1 I/O error or 10 checksum errors

    class { 'zfsonlinux':
      zed_spare_on_io_errors        => '1',
      zed_spare_on_checksum_errors  => '10',
    }

## Reference

### Classes

#### Public classes

* `zfsonlinux`: Installs and configures ZFS.

#### Private classes

* `zfsonlinux::repo::el`: Configures the ZFS on Linux yum repositories.
* `zfsonlinux::install`: Installs ZFS packages.
* `zfsonlinux::config`: Configures ZFS.
* `zfsonlinux::service`: Manages the ZFS service.
* `zfsonlinux::params`: Sets parameter defaults based on fact values.

### Parameters

#### zfsonlinux

#####`baseurl`

The baseurl used for the zfs Yumrepo.
Default is OS specific.

#####`source_baseurl`

The baseurl used for the zfs-source Yumrepo.
Default is OS specific.

#####`testing_baseurl`

The baseurl used for the zfs-testing Yumrepo.
Default is OS specific.

#####`testing_source_baseurl`

The baseurl used for the zfs-testing-source Yumrepo.
Default is OS specific.

#####`package_ensure`

The zfs package ensure value. Default is 'installed'.

#####`package_name`

The name of the zfs package to install. Default is OS specific.

#####`service_ensure`

The zfs service ensure value. Default is 'running'.

#####`service_enable`

The zfs service enable value. Default is true.

#####`service_name`

The name of the zfs service. Default is OS specific.

#####`service_hasstatus`

The zfs service hasstatus value. Default is OS specific.

#####`service_hasrestart`

The zfs service hasrestart value. Default is OS specific.

#####`service_status`

The zfs service status value. Default is OS specific.

#####`zed_debug_log`

The value used for the ZED 'ZED_DEBUG_LOG' option.
Default is '/tmp/zed.debug.log'.

#####`zed_email`

The value used for the ZED 'ZED_EMAIL' option.
Default is 'UNSET' which ensures this options is absent.

#####`zed_email_verbose`

The value used for the ZED 'ZED_EMAIL_VERBOSE' option.
Default is '0'.

#####`zed_email_interval_secs`

The value used for the ZED 'ZED_EMAIL_INTERVAL_SECS' option.
Default is '3600'.

#####`zed_lockdir`

The value used for the ZED 'ZED_LOCKDIR' option.
Default is '/var/lock'.

#####`zed_rundir`

The value used for the ZED 'ZED_RUNDIR' option.
Default is '/var/run'.

#####`zed_syslog_priority`

The value used for the ZED 'ZED_SYSLOG_PRIORITY' option.
Default is 'daemon.notice'.

#####`zed_syslog_tag`

The value used for the ZED 'ZED_SYSLOG_TAG' option.
Default is 'zed'.

#####`zed_spare_on_io_errors`

The value used for the ZED 'ZED\_SPARE\_ON\_IO\_ERRORS' option.
Default is '0'.

#####`zed_spare_on_checksum_errors`

The value used for the ZED 'ZED\_SPARE\_ON\_CHECKSUM\_ERRORS' option.
Default is '0'.

#####`tunables`

A Hash that defines options for zfs kernel module.
Default is an empty Hash.

## Limitations

This module is intended for ZFS on Linux version >= 0.6.3.

This module has been tested on:

* CentOS 6 x86_64
* Scientific Linux 6 x86_64

### Known Issues

Changes to the `tunables` will not take effect until the ZFS kernel module is reloaded.

## Development

### Testing

Testing requires the following dependencies:

* rake
* bundler

Install gem dependencies

    bundle install

Run unit tests

    bundle exec rake test

If you have Vagrant >= 1.2.0 installed you can run system tests

    bundle exec rake beaker

## TODO

## Additional Information

[ZFS on Linux](http://zfsonlinux.org/)
