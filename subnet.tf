resource "aws_subnet" "public_subnets" {
  count                   = var.public_subnet_count
  cidr_block              = replace(var.subnet_cidr_block, "x", count.index)
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = data.aws_availability_zones.availability_zones.names[count.index]
  map_public_ip_on_launch = true

  tags = var.tags
}

resource "aws_subnet" "private_subnets_application" {
  count                   = var.private_subnet_application_count
  cidr_block              = replace(var.subnet_cidr_block, "x", 10 + count.index)
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = data.aws_availability_zones.availability_zones.names[count.index]
  map_public_ip_on_launch = false

  tags = var.tags
}

resource "aws_subnet" "private_subnets_data" {
  count                   = var.private_subnet_data_count
  cidr_block              = replace(var.subnet_cidr_block, "x", 20 + count.index)
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = data.aws_availability_zones.availability_zones.names[count.index]
  map_public_ip_on_launch = false

  tags = var.tags
}