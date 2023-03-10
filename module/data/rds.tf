resource "aws_db_instance" "rds" {
  allocated_storage      = 8
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = local.database_instance_class
  db_name                = "terraform_3_tier_architecture"
  username               = "yaini"
  password               = var.database_password
  db_subnet_group_name   = aws_db_subnet_group.private_db_subnet_group.name
  skip_final_snapshot    = true
  vpc_security_group_ids = var.security_group_ids

  tags = merge(
    var.tags,
    {
      "name" = "${var.environment}-rds"
    }
  )
}