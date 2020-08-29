resource "aws_subnet" "pub_subnets" {
  count             = local.az_length
  availability_zone = local.az_names[count.index]
  vpc_id            = var.vpc_id
  # cidr_block = element(var.pub_subnet_cidr,count.index)
  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index)
  map_public_ip_on_launch = true

  tags = merge(
    {
      "Name" = "${var.env}-public-subnet-${local.az_names[count.index]}"
    },
    var.tags
  )
}

resource "aws_subnet" "pri_subnets" {
  count             = local.az_length
  availability_zone = local.az_names[count.index]
  vpc_id            = var.vpc_id
  # cidr_block = element(var.pri_subnet_cidr,count.index)
  cidr_block = cidrsubnet(var.vpc_cidr, 4, count.index + local.az_length)

  tags = merge(
    {
      "Name" = "${var.env}-private-subnet-${local.az_names[count.index]}"
    },
    var.tags
  )

}

output "pri_subnets" {
  value       = aws_subnet.pri_subnets.*.id
  description = "pri_subnets id"
}


output "pub_subnets" {
  value       = aws_subnet.pub_subnets.*.id
  description = "pub_subnets id"
}
