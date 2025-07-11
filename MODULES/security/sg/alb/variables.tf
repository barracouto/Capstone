variable "env" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR (used in dev to restrict ALB access)"
  type        = string
}

variable "on_prem_cidr" {
  description = "CIDR block for the on-prem VPN"
  type        = string
  default     = null
}