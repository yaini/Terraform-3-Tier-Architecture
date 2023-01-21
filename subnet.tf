resource "aws_subnet" "public_subnets" {
  count = var.public_subnet_count
  cidr_block = replace(var.subnet_cidr_block, "x", count.index)
  vpc_id     = aws_vpc.vpc.id

  availability_zone = data.aws_availability_zones.availability_zones.names[count.index]

  tags = var.tags
}