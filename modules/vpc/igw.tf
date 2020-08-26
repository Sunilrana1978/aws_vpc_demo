resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = merge (
    {
      "Name" =  "${var.env}-Internet-Gateway"
    },
    var.tags
  )
}


variable "igw_id" {
  type        = string
  description = "igw id"
}


output "igw_id" {
  value       = aws_internet_gateway.igw.id
  description = "description"
}