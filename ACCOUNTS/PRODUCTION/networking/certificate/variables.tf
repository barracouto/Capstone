
variable "env" {
  description = "The environment name (e.g., dev, prod)"
  type        = string
  default     = "prod"
}

variable "domain_name" {
  description = "The domain name for the public Route 53 hosted zone"
  type        = string
  default     = ""
}
