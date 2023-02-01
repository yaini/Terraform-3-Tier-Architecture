resource "aws_lb" "alb" {
  name               = "lb"
  subnets            = var.subnet_ids
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_security_group.id]

  tags = var.tags
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }

  tags = var.tags
}

resource "aws_lb_target_group" "alb_target_group" {
  name     = "alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }
}