variable "env" {
  description = "The environment name (e.g., dev, prod)"
  type        = string
  default     = ""
}

variable "domain_name" {
  description = "The domain name for the private hosted zone (e.g., internal.dev.scoutomt.com)"
  type        = string
  default     = ""
}

variable "region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = ""
}


variable "dev_vpc_id" {
  description = "The ID of the development VPC to associate with the private hosted zone"
  type        = string
  default     = ""
}

variable "internal_alb_dns_name" {
  description = "The DNS name of the internal ALB to point to (e.g., internal-alb-123.us-east-1.elb.amazonaws.com)"
  type        = string
}

variable "internal_alb_zone_id" {
  description = "The hosted zone ID of the internal ALB"
  type        = string
}
