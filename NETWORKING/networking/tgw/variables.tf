variable "env" {
  description = "Environment name (e.g., dev, prod, shared)"
  type        = string
  default     = "networking"
}

variable "on_prem_cidr" {
  description = "CIDR block used on the on-prem side"
  type        = string
}