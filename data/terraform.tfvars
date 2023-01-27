vpc_cidr_block    = "10.0.0.0/16"
subnet_cidr_block = "10.0.x.0/24"
entire_cidr_block = "0.0.0.0/0"

public_subnet_count              = 2
private_subnet_application_count = 2
private_subnet_data_count        = 2

instance_type           = "t2.micro"
database_instance_class = "db.t2.micro"

ec2_key_pair_name = "key_pair"

tags = {
  method = "terraform"
}