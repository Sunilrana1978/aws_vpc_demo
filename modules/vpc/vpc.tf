resource "aws_vpc" "main" {

  cidr_block       = var.vpc_cidr
  instance_tenancy = var.instance_tenancy

  tags = merge(
    {
      "Name" = "${var.env}-Vpc"
    },
    var.tags
  )


}


output "vpc_id" {
  value       = aws_vpc.main.id
  description = "aws_vpc id"
}




