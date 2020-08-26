variable "aws_region" {
  default = "us-west-2"
}

# variable "bucket" {
#   description = "s3 bucket name"
# }

variable "vpc_cidr" {
  type        = string
  default     = "10.0.1.0/16"
  description = "vpc_cidr_block"
}

variable "instance_tenancy" {
  type        = string
  default     = "default"
}


variable "vpc_id" {
  type        = string
  description = " vpc id"
}

variable "pub_subnet_cidr" {
  type        = list
  default     = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24","10.0.4.0/24"]
  description = "subnet_cidr_block"
}

variable "pri_subnet_cidr" {
  type        = list
  default     = ["10.1.1.0/24","10.1.2.0/24","10.1.3.0/24","10.1.4.0/24"]
  description = "subnet_cidr_block"
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
  default = "dev"
  description = "The dev environment"
}

# variable "azs" {
#   type        = "list"
#   default     = ["us-west-2a","us-west-2b","us-west-2c"]
#   description = "description"
# }

data "aws_availability_zones" "azs" {
  state = "available"
}

# variable "igw" {
#   type        = string
#   description = " igw id"
# }