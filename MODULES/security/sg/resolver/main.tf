resource "aws_security_group" "resolver_inbound_sg" {
  name   = "resolver-inbound-sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.on_prem_cidr != null ? [var.on_prem_cidr] : []
    content {
      from_port   = 53
      to_port     = 53
      protocol    = "udp"
      cidr_blocks = [ingress.value]
    }
  }

  dynamic "ingress" {
    for_each = var.on_prem_cidr != null ? [var.on_prem_cidr] : []
    content {
      from_port   = 53
      to_port     = 53
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }

  dynamic "ingress" {
    for_each = var.vpc_cidr != null ? [var.vpc_cidr] : []
    content {
      from_port   = 53
      to_port     = 53
      protocol    = "udp"
      cidr_blocks = [ingress.value]
    }
  }

  dynamic "ingress" {
    for_each = var.vpc_cidr != null ? [var.vpc_cidr] : []
    content {
      from_port   = 53
      to_port     = 53
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "resolver-inbound-sg"
    Environment = var.env
  }
}
