# Create public and provate route tables
resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
  tags = merge(
    {
      "Name" = "${var.env}-public_rt"
    },
    var.tags
  )
}

# assocate subnets to route tables.
resource "aws_route_table_association" "public" {
  count          = local.az_length
  subnet_id      = local.pub_sub_ids[count.index]
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  count             = local.az_length
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nats.id
  }
  tags = merge(
    {
      "Name" = "${var.env}-private_rt-${local.az_names[count.index]}"
    },
    var.tags
  )
}

resource "aws_route_table_association" "private" {
  count          = local.az_length
  subnet_id      = local.pri_sub_ids[count.index]
  route_table_id = aws_route_table.private_rt.*.id[count.index]
}