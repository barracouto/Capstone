resource "aws_route53_zone" "public" {
  name = var.domain_name

  tags = {
    Name        = "${var.env}-public-zone"
    Environment = var.env
  }
}

resource "aws_route53_record" "app" {
  zone_id = aws_route53_zone.public.zone_id
  name    = "app.${var.domain_name}"
  type    = "A"
  alias {
    name                   = data.terraform_remote_state.prod_alb.outputs.alb_dns_name
    zone_id                = data.terraform_remote_state.prod_alb.outputs.alb_zone_id
    evaluate_target_health = true
  }
}
