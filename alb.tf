resource "aws_lb" "loadbalancer" {
  security_groups = tolist([aws_security_group.lb_security_group.id])
  subnets         = aws_subnet.public_subnets.*.id
  idle_timeout    = 400

  depends_on = [
    aws_autoscaling_group.autoscaling_group_application
  ]
}

resource "aws_lb_target_group" "loadbalancer_target_group" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "loadbalancer_listener" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.loadbalancer_target_group.arn
  }
}