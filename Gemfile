source "https://rubygems.org"

group :development, :test do
  gem 'rake'
  gem 'puppetlabs_spec_helper', :require => false
  gem 'puppet-lint', '~> 0.3.2'
  gem 'travis-lint'
  # Adds ZFS tests to Linux
  # PR submitted: https://github.com/serverspec/serverspec/pull/231
  gem 'serverspec', :git => 'git://github.com/treydock/serverspec.git', :branch => 'add_check_zfs_to_linux'
  #  gem 'rspec-system-puppet', '~>2.0.0'
  # Adds testing of custom Facter facts
  # PR submitted: https://github.com/puppetlabs/rspec-system-puppet/pull/16
  gem 'rspec-system-puppet', :git => 'git://github.com/treydock/rspec-system-puppet.git', :branch => 'expand_facter_helper'
  #  gem 'rspec-system-serverspec', '~>1.0.0'
  # Needed to use latest serverspec gem
  # PR submitted: https://github.com/puppetlabs/rspec-system-serverspec/pull/3
  gem 'rspec-system-serverspec', :git => 'git://github.com/nagas/rspec-system-serverspec.git', :branch => 'serverspec/0.x'
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end
