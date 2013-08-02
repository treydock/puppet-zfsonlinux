require 'rspec-system/spec_helper'
require 'rspec-system-puppet/helpers'

include RSpecSystemPuppet::Helpers

RSpec.configure do |c|
  # Project root for the this module's code
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Enable colour in Jenkins
  c.tty = true

  c.include RSpecSystemPuppet::Helpers

  # This is where we 'setup' the nodes before running our tests
  c.before :suite do
    # Install puppet
    puppet_install
    puppet_master_install

    shell('puppet module install puppetlabs/stdlib --modulepath /etc/puppet/modules')
    shell('puppet module install stahnma/epel --modulepath /etc/puppet/modules')
    shell('puppet module install treydock/gpg_key --modulepath /etc/puppet/modules')
    shell('puppet module install saz/sudo --modulepath /etc/puppet/modules')

    # Temporary until the zabbix20 module is added to the Forge
    shell('yum -y install git')
    shell('git clone git://github.com/treydock/puppet-zabbix20.git /etc/puppet/modules/zabbix20')
    shell('puppet module install puppetlabs/firewall --modulepath /etc/puppet/modules')

    puppet_module_install(:source => proj_root, :module_name => 'zfsonlinux')
  end
end