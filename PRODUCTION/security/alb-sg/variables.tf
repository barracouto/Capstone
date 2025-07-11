variable "vpc_id" {
  description = "The ID of the VPC where the ALB security group will be created"
  type        = string
  default     = null
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC, used to restrict ALB access in non-prod"
  type        = string
  default     = null
}


variable "env" {
  description = "Environment name (e.g., dev, prod, shared)"
  type        = string
  default     = "prod"
}