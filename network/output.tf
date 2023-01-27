output "vpc" {
  value = aws_vpc.vpc
}
output "public_subnets" {
  value = aws_subnet.public_subnets
}

output "private_subnets_application" {
  value = aws_subnet.private_subnets_application
}
output "private_subnets_data" {
  value = aws_subnet.private_subnets_data
}

output "bastion_security_group" {
  value = aws_security_group.bastion_security_group
}
output "lb_security_group" {
  value = aws_security_group.lb_security_group
}
output "application_security_group" {
  value = aws_security_group.application_security_group
}
output "rds_security_group" {
  value = aws_security_group.rds_security_group
}
