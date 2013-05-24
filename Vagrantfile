# -*- mode: ruby -*-
# vi: set ft=ruby :

extra_disks = [
  {:path => "/Users/treydock/vagrant/sdb.vdi", :size => 10*1024},
  {:path => "/Users/treydock/vagrant/sdc.vdi", :size => 10*1024},
  {:path => "/Users/treydock/vagrant/sdd.vdi", :size => 10*1024},
  {:path => "/Users/treydock/vagrant/sde.vdi", :size => 10*1024},
  {:path => "/Users/treydock/vagrant/sdf.vdi", :size => 10*1024},
  {:path => "/Users/treydock/vagrant/sdg.vdi", :size => 10*1024},
  {:path => "/Users/treydock/vagrant/sdh.vdi", :size => 10*1024},
  {:path => "/Users/treydock/vagrant/sdi.vdi", :size => 10*1024},
  {:path => "/Users/treydock/vagrant/sdj.vdi", :size => 10*1024},
  {:path => "/Users/treydock/vagrant/sdk.vdi", :size => 10*1024},
]

$script = <<SCRIPT

sudo rpm -ivh http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm &>/dev/null
yum -q -y -e 0 install puppet &>/dev/null

cat >> /etc/puppet/hiera.yaml << EOF
---
:logger: noop
EOF

cat >> /tmp/apply_host.pp << EOF
host { 'puppet':
  ip => '127.0.0.1',
}
EOF

puppet module install puppetlabs-stdlib --modulepath /etc/puppet/modules

SCRIPT

Vagrant.configure("2") do |config|
# Uncomment the next two lines to use the CentOS base box
#  config.vm.box = 'centos-64-x64-vbox4210'
#  config.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box'
# Comment out these two lines if the above two are uncommented, to use the CentOS base box
  config.vm.box = 'scientific-64-x64-vb4210'
  config.vm.box_url = 'http://yum.tamu.edu/vagrant/scientific-64-x64-vb4210.box'

  config.vm.synced_folder "../zfsonlinux", "/etc/puppet/modules/zfsonlinux"
  config.vm.synced_folder "spec/system/modules/zpool", "/etc/puppet/modules/zpool"

  config.vm.provider :virtualbox do |vb|
  # Boot with GUI mode
    vb.gui = true

    # Adds block devices to build test zpools
    extra_disks.each_with_index do |disk, index|
      vb.customize ["createhd", "--filename", disk[:path], "--size", disk[:size]]
      vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", index+1, "--device", 0, "--type", "hdd", "--medium", disk[:path]]
    end
  end

  config.vm.provision :shell, :inline => $script

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "spec/system/manifests"
    puppet.manifest_file  = "base.pp"
    puppet.pp_path = '/etc/puppet'
    puppet.options = '--modulepath /etc/puppet/modules'
  end
end

Vagrant::Config.run do |c|
  c.vm.define 'main.vm' do |v|
    v.vm.host_name = 'main.vm'
    v.vm.base_mac = '080027B8E17C'
  end
end
