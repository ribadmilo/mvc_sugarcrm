Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu_12"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network :private_network, ip: "192.168.56.101"


  config.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
  end

  config.vm.synced_folder "./www", "/var/www", :owner=> 'www-data', :group=>'www-data', :mount_options => ['dmode=775', 'fmode=775'], create: true
  config.vm.synced_folder "./custom_config_files", "/var/custom_config_files", create: true
  config.vm.provision :shell, :path => "bootstrap.sh"
end
