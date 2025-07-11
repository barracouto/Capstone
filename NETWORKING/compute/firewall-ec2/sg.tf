# Security group for firewall EC2 instances
resource "aws_security_group" "firewall_sg" {
  name        = "${var.env}-firewall-sg"
  description = "Allows Geneve (UDP 6081) and optional SSH"
  vpc_id      = data.terraform_remote_state.firewall_vpc.outputs.vpc_id

  ingress {
    description = "Allow Geneve from within VPC"
    from_port   = 6081
    to_port     = 6081
    protocol    = "udp"
    cidr_blocks = [data.terraform_remote_state.firewall_vpc.outputs.vpc_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.env}-firewall-sg"
    Environment = var.env
  }
}