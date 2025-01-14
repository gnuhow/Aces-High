#!/bin/bash

# Setup instructions for my deployment VM
# RHEL 9 Server with GUI

$project_name = "Aces-High"
$project_name_lower = "aces-high"
$working_dir = "/opt/$project_name"

# First update Oracle VirtualBox

# update RHEL and install dependencies
sudo -i
subscription manager register
yum update
reboot

dnf install kernel-devel make gcc

# device > guest additions
# install guest additions for copy/paste
# it should run autorun when inserted by the CD

# VirtualBox Guest Additions: To build modules for other installed kernels, run
# VirtualBox Guest Additions:   /sbin/rcvboxadd quicksetup <version>
# VirtualBox Guest Additions: or
# VirtualBox Guest Additions:   /sbin/rcvboxadd quicksetup all

# devices > shared clipboard > bidirectional
# reboot

# Git
yum -y install git
cd /opt
git clone https://github.com/gnuhow/Aces-High.git
chown -R gnuhow Aces-High
chown -R gnuhow Aces-High/*

# VS Code
# in a browser: https://code.visualstudio.com/download
cd ~
rpm -i /home/gnuhow/Downloads/code-1.96.2-1734607808.el8.x86_64.rpm
rm /home/gnuhow/Downloads/code-1.96.2-1734607808.el8.x86_64.rpm

# Terraform
dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
dnf install -y terraform

cd "$working_dir/terraform"
terraform init
cd "$working_dir"

# AWS CLI
dnf install -y awscli2


# nodejs for testing JS 
# https://developers.redhat.com/hello-world/nodejs
# dnf module enable nodejs:20
# dnf install -y nodejs
# node --version


# use buildah for making container images, with rootless support
# use podman to run container images
dnf install -y buildah podman

cp -r app container
cd container
buildah build -t $project_name_lower

podman images
# podman container create localhost/aces-high:latest
# podman container start localhost/aces-high:latest 

podman run -p 8080:80 --rm $project_name_lower
