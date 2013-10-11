require 'spec_helper'

describe 'zfsonlinux::monitor::scripts' do
  include_context :defaults
  
  let(:facts) { default_facts }

  let :pre_condition do
    [
      "class { 'sudo': }",
      "class { 'zabbix20::agent': }",
      "class { 'zfsonlinux::monitor':
        monitor_tool      => 'zabbix',
      }",
    ]
  end

  it { should create_class('zfsonlinux::monitor::scripts') }
  it { should include_class('zfsonlinux::params') }

  it do
    should contain_file('arcstat_get.py').with({
      'ensure'  => 'present',
      'path'    => '/usr/local/bin/arcstat_get.py',
      'source'  => 'puppet:///modules/zfsonlinux/arcstat_get.py',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0755',
    })
  end
end
