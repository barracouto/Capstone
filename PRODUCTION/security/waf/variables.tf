variable "waf_acl_name" {
  description = "Name of the WAF Web ACL"
  type        = string
  default    = "waf-web-acl-${var.env}"
}

variable "waf_scope" {
  description = "WAF scope - use REGIONAL for ALB or CLOUDFRONT for global"
  type        = string
  default     = "REGIONAL"
}

variable "env" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
  default = "prod"
}

variable "waf_rules" {
  description = "List of managed rule groups to include in the Web ACL"
  type = list(object({
    name        = string
    priority    = number
    metric_name = string
  }))
  default = [
    {
      name        = "AWSManagedRulesLinuxRuleSet"
      priority    = 0
      metric_name = "AWS-AWSManagedRulesLinuxRuleSet"
    },
    {
      name        = "AWSManagedRulesKnownBadInputsRuleSet"
      priority    = 1
      metric_name = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
    },
    {
      name        = "AWSManagedRulesCommonRuleSet"
      priority    = 2
      metric_name = "AWS-AWSManagedRulesCommonRuleSet"
    },
    {
      name        = "AWSManagedRulesAnonymousIpList"
      priority    = 3
      metric_name = "AWS-AWSManagedRulesAnonymousIpList"
    },
    {
      name        = "AWSManagedRulesAmazonIpReputationList"
      priority    = 4
      metric_name = "AWS-AWSManagedRulesAmazonIpReputationList"
    }
  ]
}