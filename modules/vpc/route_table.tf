# Create public and provate route tables
resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
  tags = merge (
    {
      "Name" =  "${var.env}-public_rt"
    },
    var.tags
  )
}
resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nats.id
  }
  tags = merge (
    {
      "Name" =  "${var.env}-private_rt"
    },
    var.tags
  )
}
# assocate subnets to route tables.
resource "aws_route_table_association" "public" {
  count = length(var.pub_subnet_cidr)
  subnet_id      = element(aws_subnet.pub_subnets.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "private" {
  count = length(var.pri_subnet_cidr)
  subnet_id      = element(aws_subnet.pri_subnets.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}