# puppet-zfsonlinux

Installs zfsonlinux repositories and packages.

## Support

* CentOS 6.4 x86_64 (Vagrant tested only)
* Scientific Linux 6.4 x86_64

## Usage

    class { 'zfsonlinux': }

## Development

### Dependencies

* Ruby 1.8.7
* Bundler
* Vagrant >= 1.2.0

### Unit testing

1. To install dependencies run `bundle install`
2. Run tests using `bundle exec rake spec:all`

### Vagrant system tests

1. Have Vagrant >= 1.2.0 installed
2. Run tests using `bundle exec rake spec:system`

For active development the `DESTROY=no` environment variable can be passed to keep the Vagrant VM from being destroyed after a test run.

DESTROY=no bundle exec rake spec:system


