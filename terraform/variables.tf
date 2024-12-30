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
