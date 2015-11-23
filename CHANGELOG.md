## treydock-zfsonlinux changelog

Release notes for the treydock-zfsonlinux module.

------------------------------------------

#### TBD Release 1.0.0

This release is a major rewrite of this module.  Primary ZFS on Linux version supported is 0.6.3.  Version 0.6.4 has also been tested but parameters like `manage_zed_service` should not use the default value.

Detailed Changes:

* Add support for EL7
* Refactor module resources into classes and chain using the Anchor pattern
* Manage ZED configuration options
* Manage ZED service
* Manage the zfs-testing and zfs-testing-source Yumrepos
* Remove yum-plugin-priority package management
* Remove priority from Yumrepo resources
* Remove management of zfs package dependencies that are now correctly required by the zfs package.
* Remove the 'zfs_' prefix from class parameters
* Rely on the 'operatingsystemmajrelease' fact
* Remove zfs_version fact in favor of the fact provided by Facter
* Remove mk\_vdev\_alias.rb script was it was a bit too site-specific
* Update module dependency versions to be less restrictive
* Remove dependency on augeasproviders
* Remove dependency on gpg_key
* Remove management of the GPG key used for zfsonlinux EL repositories
* Refactor unit tests to match changes to module
* Add beaker-rspec acceptance tests
* Update README.md
* Add LICENSE


------------------------------------------

#### 2014-06-13 Release 0.0.1

* Initial release

This tag was used to manage ZFS on Linux <= 0.6.2
