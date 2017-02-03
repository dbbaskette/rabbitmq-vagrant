# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Went to a static method to remove dependency on plugin
  #config.hostmanager.enabled = true
  #config.hostmanager.manage_host = false
  #config.hostmanager.manage_guest = true


  config.ssh.pty = true

  config.vm.define 'rabbit1', rabbit1: true do |rabbit1|
    rabbit1.vm.box = 'dbbaskette/rabbitmq'
    rabbit1.vm.hostname = 'rabbit1'
    rabbit1.vm.network :private_network, ip: '192.168.50.11'

    # EPMD
    rabbit1.vm.network :forwarded_port, guest: 4369, host: 4369

    # AMQP (+TLS)
    rabbit1.vm.network :forwarded_port, guest: 5671, host: 5671
    rabbit1.vm.network :forwarded_port, guest: 5672, host: 5672

    # MQTT
    rabbit1.vm.network :forwarded_port, guest: 1883, host: 1883
    rabbit1.vm.network :forwarded_port, guest: 8883, host: 8883

    # ELANG for Internode Communication
    rabbit1.vm.network :forwarded_port, guest: 25672, host: 25672

    # Management Plugin
    rabbit1.vm.network :forwarded_port, guest: 15672, host: 15672

    # STOMP
    rabbit1.vm.network :forwarded_port, guest: 61613, host: 61613
    rabbit1.vm.network :forwarded_port, guest: 61614, host: 61614


    rabbit1.vm.provision "shell", inline: "sudo systemctl restart rabbitmq-server.service"
    rabbit1.vm.provision "shell", path: "./scripts/create-rabbit-user.sh"
    rabbit1.vm.provision "shell", path: "./scripts/add-hosts-file.sh"


  end

# Currently at a local cluster of 2 nodes.  To go more, the ports need to be adjusted.

  (2..2).each do |i|
    config.vm.define "rabbit#{i}" do |node|
        node.vm.box = 'dbbaskette/rabbitmq'
        node.vm.hostname = "rabbit#{i}"
        node.vm.network :private_network, ip: '192.168.50.12'
        # EPMD
        node.vm.network :forwarded_port, guest: 4369, host: 4370

        # AMQP (+TLS)
        node.vm.network :forwarded_port, guest: 5671, host: 5673
        node.vm.network :forwarded_port, guest: 5672, host: 5674

        # MQTT
        node.vm.network :forwarded_port, guest: 1883, host: 1884
        node.vm.network :forwarded_port, guest: 8883, host: 8884

        # ELANG for Internode Communication
        node.vm.network :forwarded_port, guest: 25672, host: 25673

        # Management Plugin
        node.vm.network :forwarded_port, guest: 15672, host: 15673

        # STOMP
        node.vm.network :forwarded_port, guest: 61613, host: 61615
        node.vm.network :forwarded_port, guest: 61614, host: 61616


        node.vm.provision "shell", inline: "sudo systemctl restart rabbitmq-server.service"
        node.vm.provision "shell", path: "./scripts/create-rabbit-user.sh"
        node.vm.provision "shell", path: "./scripts/add-hosts-file.sh"
        node.vm.provision "shell", path: "./scripts/cluster-join.sh"


    end

  end


end
