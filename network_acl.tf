resource "aws_network_acl" "public_network_acl" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = aws_subnet.public_subnets.*.id

  tags = var.tags
}

resource "aws_network_acl" "private_network_acl" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = aws_subnet.private_subnets_application.*.id

  tags = var.tags
}

# public subnet rules
resource "aws_network_acl_rule" "public_network_acl_ingress_http" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  protocol       = "tcp"
  from_port      = 80
  to_port        = 80
  cidr_block     = var.entire_cidr_block
}

resource "aws_network_acl_rule" "public_network_acl_egress_http" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  protocol       = "tcp"
  from_port      = 80
  to_port        = 80
  cidr_block     = var.entire_cidr_block
}

resource "aws_network_acl_rule" "public_network_acl_ingress_https" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 110
  rule_action    = "allow"
  egress         = false
  protocol       = "tcp"
  from_port      = 443
  to_port        = 443
  cidr_block     = var.entire_cidr_block
}

resource "aws_network_acl_rule" "public_network_acl_egress_https" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 110
  rule_action    = "allow"
  egress         = true
  protocol       = "tcp"
  from_port      = 443
  to_port        = 443
  cidr_block     = var.entire_cidr_block
}

resource "aws_network_acl_rule" "public_network_acl_ingress_ssh" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 120
  rule_action    = "allow"
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  cidr_block     = var.entire_cidr_block
}

resource "aws_network_acl_rule" "public_network_acl_egress_ssh" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 120
  rule_action    = "allow"
  egress         = true
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  cidr_block     = aws_vpc.vpc.cidr_block
}

resource "aws_network_acl_rule" "public_network_acl_ingress_ephemeral" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 140
  rule_action    = "allow"
  egress         = false
  protocol       = "tcp"
  from_port      = 1024
  to_port        = 65535
  cidr_block     = var.entire_cidr_block
}

resource "aws_network_acl_rule" "public_network_acl_egress_ephemeral" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 140
  rule_action    = "allow"
  egress         = true
  protocol       = "tcp"
  from_port      = 1024
  to_port        = 65535
  cidr_block     = var.entire_cidr_block
}

# private subnet rules
resource "aws_network_acl_rule" "private_network_acl_ingress_vpc" {
  network_acl_id = aws_network_acl.private_network_acl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  protocol       = -1
  from_port      = 0
  to_port        = 0
  cidr_block     = aws_vpc.vpc.cidr_block
}

resource "aws_network_acl_rule" "private_network_acl_egress_vpc" {
  network_acl_id = aws_network_acl.private_network_acl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  protocol       = -1
  from_port      = 0
  to_port        = 0
  cidr_block     = aws_vpc.vpc.cidr_block
}

resource "aws_network_acl_rule" "private_network_acl_ingress_nat" {
  network_acl_id = aws_network_acl.private_network_acl.id
  rule_number    = 110
  rule_action    = "allow"
  egress         = false
  protocol       = "tcp"
  from_port      = 1024
  to_port        = 65535
  cidr_block     = var.entire_cidr_block
}

resource "aws_network_acl_rule" "private_network_acl_egress_http" {
  network_acl_id = aws_network_acl.private_network_acl.id
  rule_number    = 120
  rule_action    = "allow"
  egress         = true
  protocol       = "tcp"
  from_port      = 80
  to_port        = 80
  cidr_block     = var.entire_cidr_block
}

resource "aws_network_acl_rule" "private_network_acl_egress_https" {
  network_acl_id = aws_network_acl.private_network_acl.id
  rule_number    = 130
  rule_action    = "allow"
  egress         = true
  protocol       = "tcp"
  from_port      = 443
  to_port        = 443
  cidr_block     = var.entire_cidr_block
}