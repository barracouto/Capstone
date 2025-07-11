resource "aws_security_group" "this" {
  name        = "${var.env}-ec2-sg"
  description = "Allow traffic from ALB"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow HTTP from ALB SG"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_sg_id]
  }

  ingress {
    description     = "Allow HTTPS from ALB SG"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [var.alb_sg_id]
  }

  dynamic "ingress" {
    for_each = var.on_prem_cidr != null && var.on_prem_cidr != "" ? [var.on_prem_cidr] : []

    content {
      description = "Allow ICMP (ping) from on-prem"
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
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
    Name        = "${var.env}-ec2-sg"
    Environment = var.env
  }
}
