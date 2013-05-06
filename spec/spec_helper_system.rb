require 'rspec-system/spec_helper'
require 'rspec-system-puppet/helpers'

module RSpecSystem
  class NodeSet::Vagrant
    def teardown
       log.info "[Vagrant#teardown] closing all ssh channels"
       RSpec.configuration.ssh_channels.each do |k,v|
         v.close unless v.closed?
       end

       log.info "[Vagrant#teardown] SKIPPING 'vagrant destroy'"
#       vagrant("destroy --force")
       nil
     end
   end
 end

RSpec.configure do |c|
  # Project root for the firewall code
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
#  fixtures_modules_root = File.join(File.dirname(__FILE__), 'fixtures', 'modules', '/*')

  # Enable colour in Jenkins
  c.tty = true

  # This is where we 'setup' the nodes before running our tests
  c.system_setup_block = proc do
    # TODO: find a better way of importing this into this namespace
    include RSpecSystemPuppet::Helpers

    # Install puppet
    puppet_install

 #   modules = []

 #   Dir.glob(File.join(fixtures_modules_root, '*')).each do |m|
 #     File.unlink(m) if File.symlink? m
 #     modules << m if File.directory? m
 #   end
    system_run('puppet module install puppetlabs-stdlib --modulepath /etc/puppet/modules')
    puppet_module_install(:source => proj_root, :module_name => 'zfsonlinux')
#    modules.each do |m|
#      puppet_module_install(:source => m, :module_name => File.basename(m))
#    end
  end
end