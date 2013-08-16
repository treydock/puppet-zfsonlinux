require 'spec_helper'

describe 'zfsonlinux::monitor::zabbix' do
  include_context :defaults

  let :pre_condition do
    [
      "class { 'sudo': }",
      "class { 'zabbix20::agent': }",
      "class { 'zfsonlinux::monitor':
        monitor_tool      => 'zabbix',
      }",
    ]
  end

  let(:facts) { default_facts }

  it { should create_class('zfsonlinux::monitor::zabbix') }
  it { should include_class('zfsonlinux::monitor') }

  it do
    should contain_file('/etc/zabbix_agentd.conf.d/zfs.conf').with({
      'ensure'  => 'present',
      'path'    => '/etc/zabbix_agentd.conf.d/zfs.conf',
      'source'  => 'puppet:///modules/zfsonlinux/monitor/zabbix/zfs.conf',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0644',
      'require' => ['File[/etc/sudoers.d/zfs]', 'File[/etc/zabbix_agentd.conf.d]'],
      'notify'  => 'Service[zabbix-agent]',
    })
  end

  context "monitor_tool_conf_dir => '/etc/foo'" do
    let :pre_condition do
      [
        "class { 'sudo': }",
        "class { 'zabbix20::agent': }",
        "class { 'zfsonlinux::monitor':
          monitor_tool            => 'zabbix',
          monitor_tool_conf_dir   => '/etc/foo',
        }",
      ]
    end

    it { should contain_file('/etc/zabbix_agentd.conf.d/zfs.conf').with_path('/etc/foo/zfs.conf') }
  end

  context "manage_sudo => false" do
    let :pre_condition do
      [
        "class { 'sudo': }",
        "class { 'zabbix20::agent': }",
        "class { 'zfsonlinux::monitor':
          monitor_tool      => 'zabbix',
          manage_sudo       => false,
        }",
      ]
    end
    
    it { should contain_file('/etc/zabbix_agentd.conf.d/zfs.conf').with_require('File[/etc/zabbix_agentd.conf.d]') }
  end
end
