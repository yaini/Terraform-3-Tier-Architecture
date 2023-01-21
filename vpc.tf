resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block

  enable_dns_hostnames = true
  enable_dns_support = true
  instance_tenancy = "default"

  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags
}