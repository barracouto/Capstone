resource "aws_lb" "this" {
  name               = "${var.env}-alb"
  internal           = var.internal
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = var.security_group_ids

  tags = {
    Name        = "${var.env}-alb"
    Environment = var.env
  }
}

# Target group only needed if we're forwarding HTTP (Dev only)
resource "aws_lb_target_group" "http" {
  count    = var.env == "dev" ? 1 : 0
  name     = "${var.env}-tg-http"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  stickiness {
    type            = "lb_cookie"
    enabled         = true
    cookie_duration = 86400
  }

  tags = {
    Name        = "${var.env}-tg-http"
    Environment = var.env
  }
}

resource "aws_lb_target_group" "https" {
  name     = "${var.env}-tg-https"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  stickiness {
    type            = "lb_cookie"
    enabled         = true
    cookie_duration = 86400
  }

  tags = {
    Name        = "${var.env}-tg-https"
    Environment = var.env
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = var.env == "prod" ? "redirect" : "forward"

    dynamic "redirect" {
      for_each = var.env == "prod" ? [1] : []
      content {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }

    dynamic "forward" {
      for_each = var.env == "dev" ? [1] : []
      content {
        target_group {
          arn = aws_lb_target_group.http[0].arn
        }
      }
    }
  }
}


resource "aws_lb_listener" "https" {
  count             = var.certificate_arn != "" ? 1 : 0
  load_balancer_arn = aws_lb.this.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.https.arn
  }
}
