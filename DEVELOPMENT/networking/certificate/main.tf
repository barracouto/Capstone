resource "aws_acm_certificate" "dev" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  tags = {
    Name        = "${var.env}-dev-acm-cert"
    Environment = var.env
  }
}

