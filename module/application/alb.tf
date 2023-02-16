resource "aws_lb" "application_loadbalancer" {
  name            = "application-loadbalancer"
  security_groups = var.lb_security_group_ids
  subnets         = var.public_subnet_ids
  idle_timeout    = 400

  depends_on = [
    aws_autoscaling_group.autoscaling_group_application
  ]

  tags = merge(
    var.tags,
    {
      "name" = "${var.environment}-lb"
    }
  )
}

resource "aws_lb_target_group" "application_loadbalancer_target_group" {
  name     = "application-loadbalancer-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    var.tags,
    {
      "name" = "${var.environment}-lb-target-group"
    }
  )
}

resource "aws_lb_listener" "application_loadbalancer_listener" {
  load_balancer_arn = aws_lb.application_loadbalancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application_loadbalancer_target_group.arn
  }

  tags = merge(
    var.tags,
    {
      "name" = "${var.environment}-lb-listener"
    }
  )
}