#!/bin/bash

sudo kubeadm reset -f 
sudo rm -r ~/.kube 
sudo rm -r /etc/cni 
sudo rm -r /var/log/containers 
sudo rm -r /var/log/pods 
sudo rm -r /var/lib/kubelet 
sudo rm -r /var/lib/etcd 
sudo rm -r /var/lib/cni

__master_ip=$(cat /etc/hosts | grep 'master' | awk '{printf $1}')
__worker_ips=$(cat /etc/hosts | grep 'worker' | awk '{printf $1 " "}')

cmd='sudo kubeadm reset -f && sudo rm -r /etc/cni && sudo rm -r /var/log/containers && sudo rm -r /var/log/pods && sudo rm -r /var/lib/kubelet && sudo rm -r /var/lib/etcd && sudo rm -r /var/lib/cni'

for ip in $__worker_ips; do
  echo 
  echo "Remove $ip from the cluster...";
  ssh "$ip" "$cmd";
  ssh "$ip" "sudo ufw delete allow from $__master_ip";
  sudo ufw delete allow from "$ip";
done

__pod_cidr='10.245.0.0/16'

sudo ufw delete allow from "$__pod_cidr"