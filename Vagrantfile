# -*- mode: ruby -*-
# vi: set ft=ruby :

require "berkshelf/vagrant"

CENTOS = {
  sudo_group: "wheel",
  box: "opscode-centos-6.3",
  url: "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_centos-6.3_chef-11.2.0.box"
}
UBUNTU = {
  sudo_group: "sudo",
  box: "opscode-ubuntu-12.04",
  url: "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.2.0.box"
}

NODES         = 3
OS            = UBUNTU
BASE_IP       = "33.33.33"
IP_INCREMENT  = 10

Vagrant::Config.run do |cluster|
  (1..NODES).each do |index|
    last_octet = index * IP_INCREMENT

    cluster.vm.define "riak#{index}".to_sym do |config|
      # Configure the VM and operating system.
      config.vm.customize ["modifyvm", :id, "--memory", 1024]
      config.vm.box = OS[:box]
      config.vm.box_url = OS[:url]

      # Setup the network and additional file shares.
      if index == 1
        config.vm.forward_port 8098, 8098
        config.vm.forward_port 8087, 8087
      end

      config.vm.host_name = "riak#{index}"
      config.vm.network :hostonly, "#{BASE_IP}.#{last_octet}"
      config.vm.share_folder "lib", "/tmp/vagrant-chef-1/lib", "lib"

      # Provision using Chef.
      config.vm.provision :chef_solo do |chef|
        chef.roles_path = "roles"

        if config.vm.box =~ /ubuntu/
          chef.add_recipe "apt"
        else
          chef.add_recipe "yum"
          chef.add_recipe "yum::epel"
        end

        chef.add_role "base"
        chef.add_role "riak"

        chef.json = {
          "authorization" => {
            "sudo" => {
              "groups" => [ OS[:sudo_group] ],
            }
          },
          "riak" => {
            "args" => {
              "+S" => 1,
              "-name" => "riak@33.33.33.#{last_octet}"
            }
          }
        }
      end
    end
  end
end
