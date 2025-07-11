variable "env" {
  description = "The environment name (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "domain_name" {
  description = "The domain name for the private hosted zone (e.g., internal.dev.scoutomt.com)"
  type        = string
  default     = null
}

variable "region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "us-east-2"
}