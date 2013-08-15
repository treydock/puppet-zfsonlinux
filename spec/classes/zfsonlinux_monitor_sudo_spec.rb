require 'spec_helper'

describe 'zfsonlinux::monitor::sudo' do
  include_context :defaults
  
  let :pre_condition do
    [
      "class { 'sudo': }",
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

  context "operatingsystemrelease => 5.9" do
    let(:facts) { default_facts.merge({:operatingsystemrelease => '5.9'}) }

    it { should_not contain_file('/etc/sudoers.d/zfs') }

    it do
      should contain_file_line("sudo disable requiretty for zabbix").with({
        'path'  => '/etc/sudoers',
        'line'  => "Defaults:zabbix !requiretty",
        'match' => "^Defaults:zabbix.*$",
      })
    end
    
    it do
      should contain_file_line("sudo define ZFS_CMDS").with({
        'path'  => '/etc/sudoers',
        'line'  => "Cmnd_Alias ZFS_CMDS = /sbin/zpool status *,/sbin/zpool list *,/sbin/zfs list *,/sbin/zfs get *",
        'match' => '^Cmnd_Alias\s+ZFS_CMDS\s+=.*$',
      })
    end
    
    it do
      should contain_file_line("sudo allow zabbix to execute ZFS_CMDS").with({
        'path'  => '/etc/sudoers',
        'line'  => "zabbix ALL=(ALL) NOPASSWD: ZFS_CMDS",
        'match' => '^zabbix\s+ALL=\(ALL\)\s+NOPASSWD:\s+ZFS_CMDS$',
      })
    end
  end

  context "with monitor_sudo_commands as string" do
    let :pre_condition do
      [
        "class { 'sudo': }",
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
