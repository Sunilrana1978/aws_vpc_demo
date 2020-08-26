terraform {
  required_version = "v0.13.0"
}

provider "aws" {
  region = var.aws_region
}

#Backend s3 config will be passed via oneclick file
# terraform {
#   backend "s3" {}
# }
