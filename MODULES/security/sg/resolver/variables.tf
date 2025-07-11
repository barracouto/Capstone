variable "env" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "on_prem_cidr" {
  description = "CIDR block used on the on-prem side"
  type        = string
  default = null
}

variable "vpc_cidr" {
  description = "Optional CIDR block for Networking VPC DNS access"
  type        = string
  default = null
}