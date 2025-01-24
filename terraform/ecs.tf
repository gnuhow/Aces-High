# resource "aws_ecr_repository" "main" {
#   name                 = var.project_name
#   image_tag_mutability = "MUTABLE"

#   image_scanning_configuration {
#     scan_on_push = false

#   }

#   tags = {
#     Name   = join("-", [var.account_name, var.project_name])
#     Deploy = var.deploy_tag
#   }
# }