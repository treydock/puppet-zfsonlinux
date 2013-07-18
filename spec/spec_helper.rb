require 'puppetlabs_spec_helper/module_spec_helper'

shared_context :defaults do
  let :default_facts do
    {
      :osfamily               => 'RedHat',
      :operatingsystem        => 'CentOS',
      :operatingsystemrelease => '6.4',
      :os_maj_version         => '6',
      :architecture           => 'x86_64',
    }
  end
end
