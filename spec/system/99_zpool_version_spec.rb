require 'spec_helper_system'

describe 'zpool_version fact:' do
  it "return valid zpool version" do
    system_run("facter -p zpool_version") do |r|
      r[:exit_code].should == 0
      r[:stdout].should =~ /\d+/
      r[:stderr].should == ''
    end
  end
end
