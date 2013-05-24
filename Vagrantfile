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

Vagrant.configure("2") do |config|
  config.vm.box = 'scientific-64-x64-vb4210'
  config.vm.box_url = 'http://yum.tamu.edu/vagrant/scientific-64-x64-vb4210.box'

  config.vm.synced_folder "../zfsonlinux", "/etc/puppet/modules/zfsonlinux"

  config.vm.provider :virtualbox do |vb|
  # Boot with GUI mode
    vb.gui = true

    # Adds block devices to build test zpools
    extra_disks.each_with_index do |disk, index|
      vb.customize ["createhd", "--filename", disk[:path], "--size", disk[:size]]
      vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", index+1, "--device", 0, "--type", "hdd", "--medium", disk[:path]]
    end
  end

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
