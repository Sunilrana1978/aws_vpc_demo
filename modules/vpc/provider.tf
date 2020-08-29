terraform {
  required_version = "v0.13.0"
}

provider "aws" {
  region = var.aws_region
}
