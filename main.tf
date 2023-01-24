data "aws_availability_zones" "availability_zones" {
  state = "available"

  exclude_names = ["ap-northeast-2b", "ap-northeast-2d"]
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
