#!/usr/bin/env bash
#recreate Rabbit user.  Hostname Change removes it
rabbitmqctl list_users
rabbitmqctl add_user rabbit rabbit
rabbitmqctl set_user_tags rabbit administrator
rabbitmqctl set_permissions -p / rabbit ".*" ".*" ".*"
rabbitmqctl list_users