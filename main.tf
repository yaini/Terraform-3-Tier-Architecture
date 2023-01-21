data "aws_availability_zones" "availability_zones" {
  state = "available"
}

output "output_availability_zones" {
  description = "availability_zones"
  value       = data.aws_availability_zones.availability_zones
}