resource "aws_security_group" "this" {
  name        = "${var.env}-alb-sg"
  description = "Allow inbound traffic to ALB"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.env == "prod" ? ["0.0.0.0/0"] : compact([var.vpc_cidr, var.on_prem_cidr])
  }

  ingress {
    description = "Allow HTTPS access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.env == "prod" ? ["0.0.0.0/0"] : compact([var.vpc_cidr, var.on_prem_cidr])
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.env}-alb-sg"
    Environment = var.env
  }
}
