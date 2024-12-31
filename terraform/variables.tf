variable "account_name" {
  description = "Name of the account"
  type        = string
  default     = "gnuhow"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "aces-high"
}

variable "deploy_tag" {
  description = "Tag for terraform deployments"
  type        = string
  default     = "tf"
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "azs" {
  description = "List of AWS Availability Zones"
  type = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "az_a" {
  description = "First AWS Availability Zone"
  type        = string
  default     = "us-east-1a"
}

variable "az_b" {
  description = "First AWS Availability Zone"
  type        = string
  default     = "us-east-1b"
}

variable "az_c" {
  description = "First AWS Availability Zone"
  type        = string
  default     = "us-east-1c"
}
