terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}


provider "aws" {
  region = "us-east-1"
}


data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_caller_identity" "current" {}
