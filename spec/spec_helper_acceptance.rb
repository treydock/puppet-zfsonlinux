require 'beaker-rspec'

hosts.each do |host|
  #install_puppet
  if host['platform'] =~ /el-(5|6)/
    relver = $1
    on host, "rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-#{relver}.noarch.rpm", { :acceptable_exit_codes => [0,1] }
    on host, 'yum install -y puppet puppet-server', { :acceptable_exit_codes => [0,1] }
    on host, 'service puppetmaster start', { :acceptable_exit_codes => [0,1] }
  end
end

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module
    puppet_module_install(:source => proj_root, :module_name => 'zfsonlinux')

    host_pp =<<-EOS
    host { 'localhost':
      ip            => '127.0.0.1',
      host_aliases  => ['localhost.localdomain', 'puppet'],
    }
    EOS

    hosts.each do |host|
      # Install dependencies
      on host, puppet('module', 'install', 'puppetlabs/stdlib'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'stahnma/epel'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'treydock/gpg_key'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'domcleal-augeasproviders'), { :acceptable_exit_codes => [0,1] }

      # Apply host resource
      apply_manifest_on(host, host_pp, :catch_failures => true)

      # Force pluginsync and custom facts to be loaded
      on host, puppet('agent', '--test'), { :acceptance_exit_codes => [0,1] }
    end
  end
end
