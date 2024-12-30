resource "aws_s3_bucket" "test" {
  bucket = join("-", [var.account_name, var.project_name])

  tags = {
    Name   = join("-", [var.account_name, var.project_name])
    Deploy = var.deploy_tag
  }
}