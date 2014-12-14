## treydock-zfsonlinux changelog

Release notes for the treydock-zfsonlinux module.

------------------------------------------

#### 2014-12-14 Release 1.0.0

This release is a major rewrite of this module.  It is written with ZFS on Linux 0.6.3 in mind.

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
* Refactor unit tests to match changes to module
* Add beaker-rspec acceptance tests
* Update README.md
* Add LICENSE


------------------------------------------

#### 2014-06-13 Release 0.0.1

* Initial release

This tag was used to manage ZFS on Linux <= 0.6.2
