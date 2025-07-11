variable "env" {
  description = "The environment name (e.g., dev, prod)"
  type        = string
  default     = "prod"
}

variable "domain_name" {
  description = "The domain name for the public Route 53 hosted zone"
  type        = string
}

variable "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  type        = string
  default     = null
}

variable "alb_zone_id" {
  description = "The hosted zone ID of the Application Load Balancer (provided by AWS)"
  type        = string
  default     = null
}
