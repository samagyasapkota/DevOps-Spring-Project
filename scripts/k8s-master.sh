#!/bin/bash

# Initialize Kubernetes cluster
kubeadm init --apiserver-advertise-address=192.168.56.20 --pod-network-cidr=10.244.0.0/16

# Setup kubeconfig for vagrant user
mkdir -p /home/vagrant/.kube
cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown vagrant:vagrant /home/vagrant/.kube/config

# Setup kubeconfig for root
mkdir -p /root/.kube
cp -i /etc/kubernetes/admin.conf /root/.kube/config

# Install Calico network plugin
kubectl --kubeconfig=/etc/kubernetes/admin.conf apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/calico.yaml

# Generate join command and save it
kubeadm token create --print-join-command > /vagrant/join-command.sh
chmod +x /vagrant/join-command.sh

echo "Kubernetes Master initialized!"
echo "Run 'vagrant ssh k8s-worker1' and execute '/vagrant/join-command.sh' to join workers"
