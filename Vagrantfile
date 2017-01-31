# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$username = "h"
$timeout = "36000"
$email = ""

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/trusty64/versions/20161207.0.0/providers/virtualbox.box"

  config.vm.define "devstack", primary: true do |devstack|
    devstack.vm.box = "trusty64"
    devstack.vm.hostname = "devstack.local"
    devstack.vm.network :private_network, ip: "192.168.56.70"
    devstack.vm.synced_folder "src", "/data/devstack/src", type: "nfs"
    devstack.vm.synced_folder "~/.ssh", "/data/user/ssh"
    devstack.vm.provider :virtualbox do |vb|
      vb.name = "devstack"
      vb.customize ["modifyvm", :id, "--memory", "512"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      vb.customize ["modifyvm", :id, "--name", "devstack.local"]
    end

    devstack.hostsupdater.aliases = ["devstack.local"]

    devstack.vm.provision 'shell' do |shell|
      shell.inline = "sudo rm -f /etc/resolv.conf"
      shell.inline = "sudo echo 'nameserver 8.8.4.4' >> /etc/resolv.conf"
      shell.inline = "sudo echo 'nameserver 8.8.8.8' >> /etc/resolv.conf"
      shell.inline = "sudo sed -i 's/^127\.0\.1\.1/127\.0\.0\.1/' /etc/hosts"
    end

    # setup git
    devstack.vm.provision 'shell' do |shell|
      shell.keep_color = true
      shell.path = 'provision/scripts/git_manager.sh'
      shell.privileged = false
      shell.args = [$timeout, $username, $email]
    end

    devstack.vm.provision :ansible do |ansible|
      ansible.playbook = "devstack.yml"
      ansible.inventory_path = "development"
      ansible.limit = "app"
      ansible.sudo = true
      ansible.verbose = "v"
    end
  end
end

