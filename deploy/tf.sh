#!/bin/bash

# Deploy Terraform templates

working_dir=$(pwd)
cd "$working_dir"

cd "$working_dir/terraform"

# terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
