variable "env" {
    description = "The environment name (e.g., dev, prod)"
    type        = string
    default     = ""
}

variable "domain_name" {
    description = "The domain name for the public Route 53 hosted zone"
    type        = string
    default     = ""
}

variable "alb_dns_name" {
    description = "The DNS name of the Application Load Balancer"
    type        = string
    default     = ""
}

variable "alb_zone_id" {
    description = "The hosted zone ID of the Application Load Balancer"
    type        = string
    default     = ""
}

variable "acm_validation_record_name" {
  description = "ACM DNS validation record name (e.g. _abc123.app.scoutomt.com)"
  type        = string
}

variable "acm_validation_record_value" {
  description = "ACM DNS validation CNAME value (e.g. _xyz456.acm-validations.aws)"
  type        = string
}
