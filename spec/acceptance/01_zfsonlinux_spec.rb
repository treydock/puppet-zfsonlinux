require 'spec_helper_acceptance'

describe 'zfsonlinux class:' do
  context "with default parameters" do
    it 'should run successfully' do
      pp = <<-EOS
        class { 'zfsonlinux': tunables => {'zfs_arc_max' => '240457728'} }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end

  describe file('/sys/module/zfs/parameters/zfs_arc_max') do
    it { should contain "240457728" }
  end

  describe command("/sbin/zpool create -f tank mirror sdb sdc") do
    pending("multiple disks not yet support in beaker") do
      it { should_not return_stderr }
      it { should return_exit_code 0 }
    end
  end

  describe zfs('tank') do
    pending("multiple disks not yet support in beaker") do
      it { should exist }
    end
  end

  describe service('zfs-import') do
    it { should be_running }
    it { should be_enabled }
  end

  describe service('zfs-mount') do
    it { should be_running }
    it { should be_enabled }
  end

  describe service('zfs-share') do
    it { should be_running }
    it { should be_enabled }
  end

  describe service('zfs-zed') do
    it { should be_running }
    it { should be_enabled }
  end

  describe file('/etc/zfs/zed.d/zed.rc') do
    it { should be_file }
    it { should be_mode 600 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should match /^ZED_DEBUG_LOG=\/tmp\/zed.debug.log$/ }
    its(:content) { should_not match /^ZED_EMAIL_ADDR.*$/ }
    its(:content) { should match /^ZED_EMAIL_PROG=mail$/ }
    its(:content) { should match /^ZED_LOCKDIR=\/var\/lock$/ }
    its(:content) { should match /^ZED_NOTIFY_INTERVAL_SECS=3600$/ }
    its(:content) { should match /^ZED_NOTIFY_VERBOSE=0$/ }
    its(:content) { should match /^ZED_RUNDIR=\/var\/run$/ }
    its(:content) { should match /^ZED_SPARE_ON_CHECKSUM_ERRORS=0$/ }
    its(:content) { should match /^ZED_SPARE_ON_IO_ERRORS=0$/ }
    its(:content) { should match /^ZED_SYSLOG_PRIORITY=daemon.notice$/ }
    its(:content) { should match /^ZED_SYSLOG_TAG=zed$/ }
  end

  context "with zed parameters defined" do
    it "should run successfully" do
      pp = <<-EOS
      class { 'zfsonlinux':
        zed_email                     => 'root',
        zed_spare_on_io_errors        => '1',
        zed_spare_on_checksum_errors  => '10',
        tunables                      => {'zfs_arc_max' => '240457728'},
      }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe file('/etc/zfs/zed.d/zed.rc') do
      its(:content) { should match /^ZED_DEBUG_LOG=\/tmp\/zed.debug.log$/ }
      its(:content) { should match /^ZED_EMAIL_ADDR=root$/ }
      its(:content) { should match /^ZED_EMAIL_PROG=mail$/ }
      its(:content) { should match /^ZED_LOCKDIR=\/var\/lock$/ }
      its(:content) { should match /^ZED_NOTIFY_INTERVAL_SECS=3600$/ }
      its(:content) { should match /^ZED_NOTIFY_VERBOSE=0$/ }
      its(:content) { should match /^ZED_RUNDIR=\/var\/run$/ }
      its(:content) { should match /^ZED_SPARE_ON_CHECKSUM_ERRORS=0$/ }
      its(:content) { should match /^ZED_SPARE_ON_IO_ERRORS=0$/ }
      its(:content) { should match /^ZED_SYSLOG_PRIORITY=daemon.notice$/ }
      its(:content) { should match /^ZED_SYSLOG_TAG=zed$/ }
    end
  end

end
