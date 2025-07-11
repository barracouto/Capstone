resource "aws_route53_zone" "this" {
  name = var.domain_name
  vpc {
    vpc_id     = data.terraform_remote_state.dev_vpc.outputs.vpc_id
    vpc_region = var.region
  }

  comment = "Private Hosted Zone for ${var.env}"

  tags = {
    Name        = "${var.env}-phz"
    Environment = var.env
  }
}

resource "aws_route53_record" "internal_api" {
  zone_id = aws_route53_zone.this.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = data.terraform_remote_state.dev_alb.outputs.alb_dns_name
    zone_id                = data.terraform_remote_state.dev_alb.outputs.alb_zone_id
    evaluate_target_health = true
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_route53_zone.this]
}

