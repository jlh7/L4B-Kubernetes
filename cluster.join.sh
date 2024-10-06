#!/bin/bash

__worker_ips=$(cat /etc/hosts | grep 'worker' | awk '{printf $1 " "}')
__token=$(sudo kubeadm token create --print-join-command)

for ip in $__worker_ips; do
  echo
  echo "Join $ip to the cluster...";
  ssh "$ip" "sudo $__token";
done