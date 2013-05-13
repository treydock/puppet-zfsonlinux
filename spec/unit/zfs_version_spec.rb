require 'spec_helper'

describe 'zfs_version fact' do

  before :each do
    Facter::Util::Resolution.stubs(:which).with("zfs").returns("/usr/bin/zfs")
  end

  it "should return correct version on Linux with zfsonlinux" do
    Facter.fact(:kernel).stubs(:value).returns("Linux")
    Facter::Util::Resolution.stubs(:exec).with("zfs upgrade -v").returns(my_fixture_read('zfsonlinux_0.6.1'))
    Facter.fact(:zfs_version).value.should == "5"
  end
end