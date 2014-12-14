require 'spec_helper_acceptance'

describe 'zfsonlinux class:' do
  context "with default parameters" do
    it 'should run successfully' do
      pp = <<-EOS
        class { 'zfsonlinux': }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
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

  describe file('/etc/zfs/zed.d/zed.rc') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it do
      content = subject.content.split(/\n/).reject { |c| c =~ /^$|^#/ }
      expected = [
        'ZED_DEBUG_LOG=/tmp/zed.debug.log',
        'ZED_EMAIL_VERBOSE=0',
        'ZED_EMAIL_INTERVAL_SECS=3600',
        'ZED_LOCKDIR=/var/lock',
        'ZED_RUNDIR=/var/run',
        'ZED_SYSLOG_PRIORITY=daemon.notice',
        'ZED_SYSLOG_TAG=zed',
        'ZED_SPARE_ON_IO_ERRORS=0',
        'ZED_SPARE_ON_CHECKSUM_ERRORS=0',
      ]
      expect(content).to match_array(expected)
    end
  end

  describe file('/etc/rc.local') do
    its(:content) { should match /^\/sbin\/zed$/ }
  end

  describe process('zed') do
    it { should be_running }
  end

  context "with zed parameters defined" do
    it "should run successfully" do
      pp = <<-EOS
      class { 'zfsonlinux':
        zed_email                     => 'root',
        zed_spare_on_io_errors        => '1',
        zed_spare_on_checksum_errors  => '10',
      }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe file('/etc/zfs/zed.d/zed.rc') do
      it do
        content = subject.content.split(/\n/).reject { |c| c =~ /^$|^#/ }
        expected = [
          'ZED_DEBUG_LOG=/tmp/zed.debug.log',
          'ZED_EMAIL=root',
          'ZED_EMAIL_VERBOSE=0',
          'ZED_EMAIL_INTERVAL_SECS=3600',
          'ZED_LOCKDIR=/var/lock',
          'ZED_RUNDIR=/var/run',
          'ZED_SYSLOG_PRIORITY=daemon.notice',
          'ZED_SYSLOG_TAG=zed',
          'ZED_SPARE_ON_IO_ERRORS=1',
          'ZED_SPARE_ON_CHECKSUM_ERRORS=10',
        ]
        expect(content).to match_array(expected)
      end
    end
  end

  context "with tunables defined" do
    it 'should run successfully' do
      pp = <<-EOS
        class { 'zfsonlinux': tunables => {'zfs_arc_max' => '240457728'} }
      EOS

      apply_manifest(pp, :catch_failures => true)
      # Need to force ZFS to reload
      shell 'zfs unmount -a'
      shell 'service zfs stop'
      shell 'modprobe -r zfs'

      apply_manifest(pp, :catch_changes => true)
    end
  end

  describe file('/sys/module/zfs/parameters/zfs_arc_max') do
    it { should contain "240457728" }
  end
end
