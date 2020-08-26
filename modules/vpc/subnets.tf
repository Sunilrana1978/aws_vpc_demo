resource "aws_subnet" "pub_subnets" {
  count =length(data.aws_availability_zones.azs.names)
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  vpc_id     = var.vpc_id
  cidr_block = element(var.pub_subnet_cidr,count.index)

  tags = merge (
    {
      "Name" =  "${var.env}-public-subnet-${count.index+1}"
    },
    var.tags
  )
}

resource "aws_subnet" "pri_subnets" {
  count =length(data.aws_availability_zones.azs.names)
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  vpc_id     = var.vpc_id
  cidr_block = element(var.pri_subnet_cidr,count.index)

  tags = merge (
    {
      "Name" =  "${var.env}-private-subnet-${count.index+1}"
    },
    var.tags
  )

}


