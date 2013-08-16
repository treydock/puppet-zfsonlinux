require 'spec_helper_system'

describe 'zfs_version fact:' do
   it "should return valid zfs version" do
     facter(:puppet => true) do |r|
       r.exit_code.should be_zero
       r.facts['zfs_version'].should =~ /\d+/
       r.stderr.should be_empty
     end
  end
end
