variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "entire_cidr_block" {}

variable "public_subnet_count" {}
variable "private_subnet_application_count" {}
variable "private_subnet_data_count" {}

variable "access_ip" {}

variable "instance_type" {}
variable "database_instance_class" {}
variable "ec2_key_pair_name" {}
variable "database_password" {}

variable "tags" {}