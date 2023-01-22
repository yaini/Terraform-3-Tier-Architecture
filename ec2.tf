resource "aws_launch_template" "bastion" {
  name_prefix            = "bastion"
  instance_type          = var.instance_type
  image_id               = data.aws_ami.amazon_linux.id
  vpc_security_group_ids = aws_security_group.bastion_security_group.*.id
  key_name               = var.ec2_key_pair_name

  tags = var.tags
}

resource "aws_launch_template" "application" {
  name_prefix            = "application"
  instance_type          = var.instance_type
  image_id               = data.aws_ami.amazon_linux.id
  vpc_security_group_ids = aws_security_group.application_security_group.*.id
  key_name               = var.ec2_key_pair_name

  tags = var.tags
}