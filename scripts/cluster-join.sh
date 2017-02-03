#!/usr/bin/env bash

# This script is run on each host that will join the cluster.

rabbitmqctl stop_app
rabbitmqctl join_cluster rabbit@rabbit1
rabbitmqctl start_app
rabbitmqctl cluster_status