resource "aws_wafv2_web_acl" "this" {
  name  = var.waf_acl_name
  scope = var.waf_scope

  description = "WAF Web ACL for ${var.env} environment"

  default_action {
    block {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = var.waf_acl_name
    sampled_requests_enabled   = true
  }

  dynamic "rule" {
    for_each = var.waf_rules
    content {
      name     = "AWS-${rule.value.metric_name}"
      priority = rule.value.priority

      override_action {
        none {}
      }

      statement {
        managed_rule_group_statement {
          name        = rule.value.name
          vendor_name = "AWS"
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = rule.value.metric_name
        sampled_requests_enabled   = true
      }
    }
  }

  tags = {
    Environment = var.env
    Name        = var.waf_acl_name
  }
}

resource "aws_wafv2_web_acl_association" "alb_association" {
  resource_arn = data.terraform_remote_state.alb.outputs.alb_arn
  web_acl_arn  = aws_wafv2_web_acl.this.arn
}


