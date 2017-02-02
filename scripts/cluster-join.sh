#!/usr/bin/env bash

# This script is run on each host that will join the cluster.

sudo rabbitmqctl stop_app
sudo rabbitmqctl join_cluster rabbit@rabbit1
sudo rabbitmqctl start_app
sudo rabbitmqctl cluster_status