resource "aws_eip" "nat_eip" {
  vpc = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id     = aws_eip.nat_eip.id
  subnet_id         = aws_subnet.public_subnets.*.id[0]

  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags
}