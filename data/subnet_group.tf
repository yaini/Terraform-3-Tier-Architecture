resource "aws_db_subnet_group" "private_db_subnet_group" {
  name       = "private_db_subnet_group"
  subnet_ids = module.network.private_subnets_data.*.id

  tags = var.tags
}