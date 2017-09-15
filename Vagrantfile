#
# Mockup environment base-state
#

# Environment Name
ENVIRONMENT = "basebox"

# Node Count
COUNT = 1

# Vagrant API Version
API_VERSION = "2"

# Path awareness (external includes)
ROOT_PATH = File.dirname(__FILE__)

Vagrant.configure(2)  do |config|

  # Hostmanager
  config.hostmanager.enabled = true

  # Global saltstack provisioning
  config.vm.provision :salt, run: 'always' do |salt|
    salt.run_highstate = true
    salt.verbose       = true
    salt.colorize      = true
    salt.masterless    = true
  end

  # File Structure 
  config.vm.synced_folder  ROOT_PATH + '/saltstack/.', '/vagrant', disabled: true
  config.vm.synced_folder  ROOT_PATH + '/saltstack/etc/minion.d', '/etc/salt/minion.d'
  config.vm.synced_folder  ROOT_PATH + '/saltstack/salt', '/srv/salt'
  config.vm.synced_folder  ROOT_PATH + '/saltstack/pillar', '/srv/pillar'
  config.vm.synced_folder  ROOT_PATH + '/saltstack/formulas', '/srv/formulas'

  # Minions
  (1..COUNT).each do |i|

    config.vm.define ENVIRONMENT + "#{i}" do |basebox|
      basebox.vm.host_name = ENVIRONMENT + "#{i}-vagrant"
      basebox.vm.provision :hostmanager

      basebox.vm.provider :virtualbox do |provider,override|


          #vbox config
          provider.memory = 2048
          override.vm.box = 'bento/debian-8.7'
          override.vm.network "private_network", ip: "172.28.1.100"

          #old vbox bug hax
          provider.customize ['modifyvm', :id, '--cableconnected1', 'on']
      end 
    end

  end
end
