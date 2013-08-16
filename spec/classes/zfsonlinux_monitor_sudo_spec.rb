require 'spec_helper'

describe 'zfsonlinux::monitor::sudo' do
  include_context :defaults
  
  let :pre_condition do
    [
      "class { 'sudo': }",
      "class { 'zabbix20::agent': }",
      "class { 'zfsonlinux::monitor':
        monitor_tool  => 'zabbix',
      }",
    ]
  end

  let(:facts) { default_facts }

  it { should create_class('zfsonlinux::monitor::sudo') }
  it { should include_class('zfsonlinux::monitor') }
  it { should include_class('zfsonlinux::params') }

  it do
    should contain_file('/etc/sudoers.d/zfs').with({
      'ensure'  => 'present',
      'path'    => '/etc/sudoers.d/zfs',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0440',
      'require' => 'Package[sudo]',
    }) \
    .with_content(/^Defaults:zabbix !requiretty$/) \
    .with_content(/^Cmnd_Alias ZFS_CMDS = \/sbin\/zpool status \*,\/sbin\/zpool list \*,\/sbin\/zfs list \*,\/sbin\/zfs get \*$/) \
    .with_content(/^zabbix ALL=\(ALL\) NOPASSWD: ZFS_CMDS$/)
  end

  context "with monitor_sudo_commands as string" do
    let :pre_condition do
      [
        "class { 'sudo': }",
        "class { 'zabbix20::agent': }",
        "class { 'zfsonlinux::monitor':
          monitor_tool  => 'zabbix',
          monitor_sudo_commands => 'cmd1,cmd2,cmd3',
        }",
      ]
    end

    it do
      should contain_file('/etc/sudoers.d/zfs') \
      .with_content(/^Cmnd_Alias ZFS_CMDS = cmd1,cmd2,cmd3$/)
    end
  end
end
