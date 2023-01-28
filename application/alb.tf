resource "aws_lb" "application_loadbalancer" {
  name            = "application_loadbalancer"
  security_groups = tolist([module.network.lb_security_group.id])
  subnets         = module.network.public_subnets.*.id
  idle_timeout    = 400

  depends_on = [
    aws_autoscaling_group.autoscaling_group_application
  ]
}

resource "aws_lb_target_group" "application_loadbalancer_target_group" {
  name     = "application_loadbalancer_target_group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.network.vpc.id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "application_loadbalancer_listener" {
  load_balancer_arn = aws_lb.application_loadbalancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application_loadbalancer_target_group.arn
  }
}