require 'spec_helper_system'

describe 'zfsonlinux class:' do
  context 'should run successfully' do
    pp = <<-EOS
      class { 'zfsonlinux': tunables => {'zfs_arc_max' => '240457728', 'zfs_arc_min' => '120228864'} }
    EOS

    context puppet_apply(pp) do
      its(:stderr) { should be_empty }
      its(:exit_code) { should_not == 1 }
      its(:refresh) { should be_nil }
      its(:stderr) { should be_empty }
      its(:exit_code) { should be_zero }
    end
  end

  context 'should create zpool' do
# Current zpool type doesn't support 'force'
#    pp = <<-EOS
#      zpool { 'tank': mirror => ['sdb', 'sdc'], force => true }
#    EOS
#
#    context puppet_apply(pp) do
#      its(:stderr) { should be_empty }
#      its(:exit_code) { should_not == 1 }
#      its(:refresh) { should be_nil }
#      its(:stderr) { should be_empty }
#      its(:exit_code) { should be_zero }
#    end

    context shell "/sbin/zpool create -f tank mirror sdb sdc" do
      its(:exit_code) { should be_zero }
      its(:stderr) { should be_empty }
    end
    
    describe zfs('tank') do
      it { should exist }
    end
  end

  context 'should have correct tunables' do
    describe file('/sys/module/zfs/parameters/zfs_arc_max') do
      it { should contain "240457728" }
    end
    
    describe file('/sys/module/zfs/parameters/zfs_arc_min') do
      it { should contain "120228864" }
    end
  end
end
