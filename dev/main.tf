
module "my_vpc" {
  source           = "../modules/vpc"
  vpc_cidr         = "192.168.0.0/16"
  instance_tenancy = "default"
  vpc_id           = module.my_vpc.vpc_id
  igw_id           = module.my_vpc.igw_id
  nats_id          = module.my_vpc.nats_id
  pri_subnets      = module.my_vpc.pri_subnets
  pub_subnets      = module.my_vpc.pub_subnets
  env              = "dev"
  # pri_subnets_id=module.my_vpc.pri_subnets_id
  # pub_subnets_id=module.my_vpc.pub_subnets_id
  #pub_subnet_cidr = ["192.168.1.0/24","192.168.2.0/24","192.168.3.0/24","192.168.4.0/24"] 
  #pri_subnet_cidr = ["192.168.5.0/24","192.168.6.0/24","192.168.7.0/24","192.168.8.0/24"] 
}

module "my_s3" {
  source           = "../modules/s3"
 
}


output "vpc_id" {
  value       = module.my_vpc.vpc_id
  description = "aws_vpc id"
}

output "igw_id" {
  value       = module.my_vpc.igw_id
  description = "aws_vpc id"
}

output "nats_id" {
  value       =  module.my_vpc.nats_id
  description = "aws_vpc id"
}

output "pri_subnets" {
  value       =  module.my_vpc.pri_subnets
  description = "pri_subnets id"
}

output "pub_subnets" {
  value       =  module.my_vpc.pub_subnets
  description = "pub_subnets id"
}