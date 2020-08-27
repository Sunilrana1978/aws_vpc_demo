

# Nat gateway #1
resource "aws_eip" "eips" {
  # count = length(var.pub_subnet_cidr)
  # count=1
}
resource "aws_nat_gateway" "nats" {
  #count = 1
  #   allocation_id = element(aws_eip.eips.*.id, count.index) 
  #   subnet_id = element(aws_subnet.pub_subnets.*.id, count.index)
  allocation_id = aws_eip.eips.id
  subnet_id     = element(aws_subnet.pub_subnets.*.id, 1)
}

variable "nats_id" {
  type        = string
  description = "igw id"
}

output "nats_id" {
  value       = aws_nat_gateway.nats.id
  description = "aws_nat_gateway nats id"
}
