module "my_vpc" {
  source = "../modules/vpc"
  vpc_cidr = "192.167.0.0/16"
  instance_tenancy = "default"
  vpc_id = module.my_vpc.vpc_id
  igw_id = module.my_vpc.igw_id
  nats_id = module.my_vpc.nats_id
  env = "test"
  # pri_subnets_id=module.my_vpc.pri_subnets_id
  # pub_subnets_id=module.my_vpc.pub_subnets_id
  pub_subnet_cidr = ["192.167.1.0/24","192.167.2.0/24","192.167.3.0/24","192.167.4.0/24"] 
  pri_subnet_cidr = ["192.167.5.0/24","192.167.6.0/24","192.167.7.0/24","192.167.8.0/24"] 
}