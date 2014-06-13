require 'spec_helper'

describe 'zpool_version fact' do

  before :each do
    Facter.fact(:kernel).stubs(:value).returns("Linux")
    Facter::Util::Resolution.stubs(:which).with("zpool").returns("/sbin/zpool")
  end

  it "should return correct version on Linux with zfsonlinux" do
    Facter::Util::Resolution.stubs(:exec).with("zpool upgrade -v").returns(my_fixture_read('zpool_upgrade_v_zfsonlinux'))
    Facter.fact(:zpool_version).value.should == "28"
  end
end
