resource "aws_subnet" "pub_subnets" {
  count =local.az_length
  availability_zone = local.az_names[count.index]
  vpc_id     = var.vpc_id
  # cidr_block = element(var.pub_subnet_cidr,count.index)
  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index)

  tags = merge (
    {
      "Name" =  "${var.env}-public-subnet-${count.index+1}"
    },
    var.tags
  )
}

resource "aws_subnet" "pri_subnets" {
  count =local.az_length
  availability_zone = local.az_names[count.index]
  vpc_id     = var.vpc_id
  # cidr_block = element(var.pri_subnet_cidr,count.index)
  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index + local.az_length)

  tags = merge (
    {
      "Name" =  "${var.env}-private-subnet-${count.index+1}"
    },
    var.tags
  )

}


