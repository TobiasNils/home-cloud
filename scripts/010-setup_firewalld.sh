#!/bin/bash

############################################################
# setup firewalld for a public Kubernetes Cluster
############################################################

# determine if we run as sudo
userid="${SUDO_USER:-$USER}"
if [ "$userid" == 'root' ]
  then 
    echo "Please run the setup as sudo and not as root!"
    exit 1
fi
if [ "$EUID" -ne 0 ]
  then 
    echo "Please run setup as sudo!"
    exit 1
fi

# trust cluster sources
firewall-cmd --permanent --zone=trusted --add-source=10.42.0.0/16 # pods
firewall-cmd --permanent --zone=trusted --add-source=10.43.0.0/16 # services
# setup new zone for cluster
firewall-cmd --new-zone=cluster --permanent
firewall-cmd --reload
# allow web-server incoming and letsencrypt access from anywhere
firewall-cmd --permanent --zone=cluster --add-port=443/tcp 
firewall-cmd --permanent --zone=cluster --add-port=80/tcp
firewall-cmd --permanent --zone=cluster --add-port=6443/tcp # apiserver
firewall-cmd --permanent --zone=cluster --add-source=192.168.44.0/24 # local network
firewall-cmd --permanent --set-default-zone cluster

# ufw allow ssh comment 'allow ssh access form anywhere'
# # the https rule is only needed on master node
# ufw allow 443 comment 'allow https only'
# ufw allow from 10.0.0.0/8

# # Uncomment this to allow your kubernetes cluster to access internal communication
# # replace with the public IPs for each cluster node
# #ufw allow from x.y.a.b comment 'allow your ceph cluster nodes'
# #ufw allow from x.y.a.c
# #ufw allow from x.y.a.d


firewall-cmd --reload
systemctl enable firewalld --now

# setup finished
#############################################################
