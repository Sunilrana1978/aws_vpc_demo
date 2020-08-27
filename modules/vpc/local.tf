locals {
  az_names  = data.aws_availability_zones.azs.names
  az_length = length(local.az_names)
  # https://www.hashicorp.com/blog/terraform-0-12-conditional-operator-improvements/
  pub_sub_ids    = var.aws_region == "us-west-2" ? slice(aws_subnet.pub_subnets.*.id, 0, 2) : aws_subnet.pub_subnets.*.id
  pri_sub_ids    = aws_subnet.pri_subnets.*.id
  pub_sub_length = length(local.pub_sub_ids)
}