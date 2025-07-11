
variable "env" {
  description = "The environment name (e.g., dev, dev)"
  type        = string
  default     = "dev"
}

variable "domain_name" {
  description = "The domain name for the public Route 53 hosted zone"
  type        = string
  default     = ""
}
