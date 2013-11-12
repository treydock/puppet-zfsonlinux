require 'spec_helper_system'

describe 'zfsonlinux::monitor class:' do
  context 'should run successfully' do
    pp = <<-EOS
      class { 'sudo': purge => false, config_file_replace => false }
      class { 'zabbix20::agent': }
      class { 'zfsonlinux': }
      class { 'zfsonlinux::monitor': monitor_tool => 'zabbix' }
    EOS

    context puppet_apply(pp) do
      its(:stderr) { should be_empty }
      its(:exit_code) { should_not == 1 }
      its(:refresh) { should be_nil }
      its(:stderr) { should be_empty }
      its(:exit_code) { should be_zero }
    end
  end
end
