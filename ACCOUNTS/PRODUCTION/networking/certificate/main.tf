resource "aws_acm_certificate" "shared" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  tags = {
    Name        = "${var.env}-shared-acm-cert"
    Environment = var.env
  }
}

