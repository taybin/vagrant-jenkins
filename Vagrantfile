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

  # support for dhcp addresses
  cached_addresses = {}
  config.hostmanager.ip_resolver = proc do |vm, resolving_vm|
    if cached_addresses[vm.name].nil?
      if hostname = (vm.ssh_info && vm.ssh_info[:host])
        vm.communicate.execute("/usr/sbin/ip addr show enp0s8 | grep 'inet ' | xargs | cut -f 2 -d ' '| cut -f 1 -d '/' 2>&1") do |type, contents|
          cached_addresses[vm.name] = contents.split("\n").first[/(\d+\.\d+\.\d+\.\d+)/, 1]
        end
      end
    end
    cached_addresses[vm.name]
  end

  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box
  end

  config.vm.box = "oculushut/jenkins"

  config.vm.hostname = 'jenkins'
  config.vm.network :private_network, type: :dhcp
  config.vm.provision :shell, path: 'install.sh'
end
