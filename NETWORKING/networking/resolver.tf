resource "aws_route53_resolver_endpoint" "outbound" {
  name               = "networking-outbound-resolver"
  direction          = "OUTBOUND"
  security_group_ids = [aws_security_group.resolver_outbound_sg.id]

  ip_address {
    subnet_id = module.vpc.private_subnet_ids[0]
  }

  ip_address {
    subnet_id = module.vpc.private_subnet_ids[1]
  }

  tags = {
    Name = "networking-outbound-resolver"
  }
}


resource "aws_route53_resolver_rule" "forward_dev_dns" {
  domain_name          = "dev.app.scoutomt.com"
  rule_type            = "FORWARD"
  name                 = "forward-dev-dns"
  resolver_endpoint_id = aws_route53_resolver_endpoint.outbound.id

  target_ip {
    ip = "10.0.1.120"
  }

  target_ip {
    ip = "10.0.1.53"
  }
}

resource "aws_route53_resolver_rule_association" "associate_with_networking" {
  resolver_rule_id = aws_route53_resolver_rule.forward_dev_dns.id
  vpc_id           = module.vpc.vpc_id
  name             = "forward-dev-dns-assoc"
}

resource "aws_security_group" "resolver_outbound_sg" {
  name        = "resolver-outbound-sg"
  description = "Allow DNS outbound"
  vpc_id      = module.vpc.vpc_id

  egress {
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["10.0.1.0/24"]
  }

  egress {
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
