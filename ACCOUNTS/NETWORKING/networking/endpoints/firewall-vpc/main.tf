resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = data.terraform_remote_state.networking.outputs.vpc_id
  service_name      = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"
  subnet_ids = [
    data.terraform_remote_state.networking.outputs.private_subnet_1_id,
    data.terraform_remote_state.networking.outputs.private_subnet_2_id
  ]
  security_group_ids  = [aws_security_group.this.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id            = data.terraform_remote_state.networking.outputs.vpc_id
  service_name      = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type = "Interface"
  subnet_ids = [
    data.terraform_remote_state.networking.outputs.private_subnet_1_id,
    data.terraform_remote_state.networking.outputs.private_subnet_2_id
  ]
  security_group_ids  = [aws_security_group.this.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id            = data.terraform_remote_state.networking.outputs.vpc_id
  service_name      = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type = "Interface"
  subnet_ids = [
    data.terraform_remote_state.networking.outputs.private_subnet_1_id,
    data.terraform_remote_state.networking.outputs.private_subnet_2_id
  ]
  security_group_ids  = [aws_security_group.this.id]
  private_dns_enabled = true
}

resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id      = data.terraform_remote_state.networking.outputs.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "ingress_from_ec2" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [data.terraform_remote_state.networking.outputs.vpc_cidr_block]
  security_group_id = aws_security_group.this.id
  description       = "Allow HTTPS from networking VPC"
}
