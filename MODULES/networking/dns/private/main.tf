resource "aws_route53_zone" "this" {
  name = var.domain_name
  vpc {
    vpc_id     = var.dev_vpc_id
    vpc_region = var.region
  }

  comment = "Private Hosted Zone for ${var.env}"

  tags = {
    Name        = "${var.env}-phz"
    Environment = var.env
  }
}

# Internal record pointing to ALB
resource "aws_route53_record" "internal_api" {
  zone_id = aws_route53_zone.this.zone_id
  name    = "api.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.internal_alb_dns_name
    zone_id                = var.internal_alb_zone_id
    evaluate_target_health = true
  }

  # Optional tagging for audit clarity
  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_route53_zone.this]
}

# Optional cross-account VPC association
resource "aws_route53_vpc_association_authorization" "dev" {
  count       = var.dev_vpc_id != var.dev_vpc_id ? 1 : 0
  zone_id     = aws_route53_zone.this.zone_id
  vpc_id      = var.dev_vpc_id
  vpc_region  = var.region
}

resource "aws_route53_zone_association" "dev" {
  count       = var.dev_vpc_id != var.dev_vpc_id ? 1 : 0
  zone_id     = aws_route53_zone.this.zone_id
  vpc_id      = var.dev_vpc_id
  vpc_region  = var.region
}
