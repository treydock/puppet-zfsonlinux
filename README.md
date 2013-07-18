# puppet-zfsonlinux [![Build Status](https://travis-ci.org/treydock/puppet-zfsonlinux.png)](https://travis-ci.org/treydock/puppet-zfsonlinux)

Installs zfsonlinux repositories and packages.

## Support

* CentOS 6.4 x86_64 (Vagrant tested only)
* Scientific Linux 6.4 x86_64

## Usage

    class { 'zfsonlinux': }

## Development

### Dependencies

* rake
* bundler

### Unit testing

Install gem dependencies

    bundle install

Run unit tests

    bundle exec rake ci

### Vagrant system tests

If you have Vagrant >= 1.1.0 installed you can run system tests

    bundle exec rake spec:system

To test this module against Scientific Linux, the following rake command can be used

    RSPEC_SET=scientific-64-x64 bundle exec rake spec:system