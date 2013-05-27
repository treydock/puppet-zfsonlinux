require 'spec_helper_system'

describe 'zfs_version fact:' do
  it "return valid zfs version" do
    system_run("facter -p zfs_version") do |r|
      r[:exit_code].should == 0
      r[:stdout].should =~ /\d+/
      r[:stderr].should == ''
    end
  end
end
