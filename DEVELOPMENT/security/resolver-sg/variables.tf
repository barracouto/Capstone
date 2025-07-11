variable "vpc_id" {
  description = "The ID of the VPC where the SSM endpoint SG will be created"
  type        = string
  default     = null
}

variable "env" {
  description = "Environment name (e.g., dev, prod, shared)"
  type        = string
  default     = "dev"
}

variable "on_prem_cidr" {
  description = "CIDR block used on the on-prem side"
  type        = string
}

variable "vpc_cidr" {
  description = "Optional CIDR block for Networking VPC DNS access"
  type        = string
  default     = "10.0.20.0/24"
}