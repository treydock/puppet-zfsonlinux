require 'spec_helper'

describe 'zol_version fact' do
  
  before :each do
    Facter.clear
    Facter.fact(:osfamily).stubs(:value).returns("RedHat")
  end

  it "should return 0.6.4.2" do
    Facter::Util::Resolution.stubs(:exec).with("rpm -q --queryformat '%{NAME}-%{VERSION}' zfs").returns("zfs-0.6.4.2")
    Facter.fact(:zol_version).value.should == "0.6.4.2"
  end

  it "should handle package not installed" do
    Facter::Util::Resolution.stubs(:exec).with("rpm -q --queryformat '%{NAME}-%{VERSION}' zfs").returns("package zfs is not installed\n")
    Facter.fact(:zol_version).value.should == nil
  end
end
