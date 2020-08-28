variable "aws_region" {
  default = "us-west-2"
}

variable "tags" {
  type = map(string)
  default = {
    "appId"       = "demo-aws-app"
    "appName"     = "demo Aws application"
    "department"  = "demo"
    "projectCode" = "123"
  }
}

variable "env" {
  default     = "dev"
  description = "The dev environment"
}


