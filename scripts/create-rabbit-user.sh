#!/usr/bin/env bash
#recreate Rabbit user.  Hostname Change removes it
sudo rabbitmqctl list_users
sudo rabbitmqctl add_user rabbit rabbit
sudo rabbitmqctl set_user_tags rabbit administrator
sudo rabbitmqctl set_permissions -p / rabbit ".*" ".*" ".*"
sudo rabbitmqctl list_users