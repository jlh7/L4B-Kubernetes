#!/bin/bash

__master_ip=$(cat /etc/hosts | grep 'master' | awk '{printf $1}')
__master_name=$(cat /etc/hosts | grep 'master' | awk '{printf $3}')
__worker_ips=$(cat /etc/hosts | grep 'worker' | awk '{printf $1 " "}')

for ip in $__worker_ips; do
  echo
  echo "Allow $ip to join the cluster...";
  sudo ufw allow from "$ip";
  ssh "$ip" "sudo ufw allow from $__master_ip";
done

__service_cidr='10.250.0.0/16'
__pod_cidr='10.245.0.0/16'

sudo ufw allow from "$__pod_cidr"

sudo kubeadm init --control-plane-endpoint="$__master_name" \
--apiserver-advertise-address="$__master_ip" \
--service-cidr="$__service_cidr" \
--pod-network-cidr="$__pod_cidr"

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#kubectl create -f kube-flannel.yml
kubectl get no -o wide && echo && kubectl get all -A -o wide