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

# skip this, it creates a loop so you can't delete stuff
# import resources after creating VPC
# default_route_table_id=$(terraform state show aws_vpc.main | grep default_route_table_id | xargs | cut -d " " -f 3)
# terraform import aws_route_table.public $default_route_table_id
# terraform state rm aws_route_table.public

