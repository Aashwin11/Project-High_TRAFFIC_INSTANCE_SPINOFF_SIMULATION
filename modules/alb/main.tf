resource "aws_lb" "main-alb" {
  name               = "${var.project-name}-alb"
  load_balancer_type = "application"
  security_groups    = [var.sg-alb-id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false
  tags = {
    Name = "${var.project-name}-alb"
  }
}

resource "aws_lb_target_group" "this" {
  name     = "${var.project-name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 3
  }

  tags = {
    Name = "${var.project-name}-tg"
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.main-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group_attachment" "this" {
  count            = length(var.instance-ids)
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.instance-ids[count.index]
  port             = 80
}
