resource "aws_vpc" "private" {
  cidr_block = "10.2.0.0/16"
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name   = join("-", [var.project_name, "private"])
    Deploy = var.deploy_tag
  }
}

resource "aws_vpc" "public" {
  cidr_block = "10.3.0.0/16"
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name   = join("-", [var.project_name, "public"])
    Deploy = var.deploy_tag
  }
}
