#!/bin/bash
# Learn Terraform - Provision an EKS Cluster

This repo is a companion repo to the [Provision an EKS Cluster tutorial](https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks), containing
Terraform configuration files to provision an EKS cluster on AWS.


# configures jenkins
login in jenkins server (local/VM on cloud)
follow the following cmd 

# change the directory to /opt/
cd ../../
cd /opt/

# switch to sudo user 
sudo su

# update the vm
apt-get update

# Install zip
apt install zip -y

# install tar
apt install tar

# install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

# configure aws 
aws --version
aws configure set aws_access_key_id #################
aws configure set aws_secret_access_key ###################
aws configure set region us-east-1
aws configure set output json

# install docker 
wget https://raw.githubusercontent.com/lerndevops/labs/master/scripts/installDocker.sh -P /tmp
chmod 755 /tmp/installDocker.sh
bash /tmp/installDocker.sh

#install terraform
wget https://raw.githubusercontent.com/lerndevops/labs/master/scripts/installTerraform.sh -P /tmp
chmod 755 /tmp/installTerraform.sh
bash /tmp/installTerraform.sh

# install eksctl
# for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

# (Optional) Verify checksum
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

sudo mv /tmp/eksctl /usr/local/bin
