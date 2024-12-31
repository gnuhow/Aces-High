resource "aws_vpc" "main" {
  cidr_block                       = "10.2.0.0/16"
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name   = var.project_name
    Deploy = var.deploy_tag
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.project_name
    Deploy = var.deploy_tag
  }
}

resource "aws_subnet" "private1_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.2.0.0/24"
  # ipv6_cidr_block   = "2600:1f18:351f:1100::/64"
  availability_zone = var.az_a
  tags = {
    Name   = join("-", [var.project_name, "private1", var.az_a])
    Deploy = var.deploy_tag
  }
}


resource "aws_subnet" "private1_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.2.1.0/24"
  # ipv6_cidr_block   = "2600:1f18:351f:1101::/64"
  availability_zone = var.az_b
  tags = {
    Name   = join("-", [var.project_name, "private1", var.az_b])
    Deploy = var.deploy_tag
  }
}


resource "aws_subnet" "private1_c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.2.2.0/24"
  # ipv6_cidr_block   = "2600:1f18:351f:1102::/64"
  availability_zone = var.az_c
  tags = {
    Name   = join("-", [var.project_name, "private1", var.az_c])
    Deploy = var.deploy_tag
  }
}


resource "aws_subnet" "public1_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.2.100.0/24"
  # ipv6_cidr_block   = "2600:1f18:351f:1100::/64"
  availability_zone = var.az_a
  tags = {
    Name   = join("-", [var.project_name, "public1", var.az_a])
    Deploy = var.deploy_tag
  }
}


resource "aws_subnet" "public1_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.2.101.0/24"
  # ipv6_cidr_block   = "2600:1f18:351f:1101::/64"
  availability_zone = var.az_b
  tags = {
    Name   = join("-", [var.project_name, "public1", var.az_b])
    Deploy = var.deploy_tag
  }
}


resource "aws_subnet" "public1_c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.2.102.0/24"
  # ipv6_cidr_block   = "2600:1f18:351f:1102::/64"
  availability_zone = var.az_c
  tags = {
    Name   = join("-", [var.project_name, "public1", var.az_c])
    Deploy = var.deploy_tag
  }
}


resource "aws_route_table" "private1_a" {
  vpc_id = aws_vpc.main.id
  
  tags = {
    Name   = join("-", [var.project_name, "private1", var.az_a])
    Deploy = var.deploy_tag
  }
}


resource "aws_route_table" "private1_b" {
  vpc_id = aws_vpc.main.id
  
  tags = {
    Name   = join("-", [var.project_name, "private1", var.az_b])
    Deploy = var.deploy_tag
  }
}


resource "aws_route_table" "private1_c" {
  vpc_id = aws_vpc.main.id
  
  tags = {
    Name   = join("-", [var.project_name, "private1", var.az_c])
    Deploy = var.deploy_tag
  }
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  
  tags = {
    Name   = join("-", [var.project_name, "public"])
    Deploy = var.deploy_tag
  }
}
