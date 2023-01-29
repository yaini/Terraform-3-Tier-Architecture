# launch template
resource "aws_launch_template" "bastion" {
  name_prefix            = "bastion"
  instance_type          = local.instance_type
  image_id               = data.aws_ami.amazon_linux.id
  vpc_security_group_ids = var.bastion_security_group_ids
  key_name               = local.ec2_key_pair_name

  tags = var.tags
}

resource "aws_launch_template" "application" {
  name_prefix            = "application"
  instance_type          = local.instance_type
  image_id               = data.aws_ami.amazon_linux.id
  vpc_security_group_ids = var.application_security_group_ids
  key_name               = local.ec2_key_pair_name
  user_data              = filebase64("./script/install_apache.sh")

  tags = var.tags
}

# auto scaling group
resource "aws_autoscaling_group" "autoscaling_group_bastion" {
  name                = "autoscaling-group-bastion"
  vpc_zone_identifier = var.public_subnet_ids
  min_size            = 1
  max_size            = 1
  desired_capacity    = 1

  launch_template {
    id      = aws_launch_template.bastion.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_group" "autoscaling_group_application" {
  name                = "autoscaling-group-application"
  vpc_zone_identifier = var.private_subnet_ids
  min_size            = 2
  max_size            = 3
  desired_capacity    = 2

  target_group_arns = tolist([aws_lb_target_group.application_loadbalancer_target_group.arn])

  launch_template {
    id      = aws_launch_template.application.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "autoscaling_group_application_attachment" {
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group_application.id
  lb_target_group_arn    = aws_lb_target_group.application_loadbalancer_target_group.arn
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



