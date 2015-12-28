# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  config.ssh.forward_agent = true

  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box
  end

  config.vm.box = "ubuntu/trusty64"

  config.vm.hostname = 'jenkins'
  config.vm.network :private_network, ip: '192.168.35.2'
  config.vm.provision :shell, path: 'install.sh'
end
