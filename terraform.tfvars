vpc_cidr_block = "10.0.0.0/16"
subnet_cidr_block = "10.0.x.0/24"
entire_cidr_block = "0.0.0.0/0"

public_subnet_count = 2
private_subnet_application_count = 2
private_subnet_data_count = 2

tags = {
  method = "terraform"
}