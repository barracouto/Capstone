variable "vpc_id" {
  description = "The ID of the VPC where the EC2 SG will be created"
  type        = string
  default     = null
}


variable "alb_sg_id" {
  description = "The ID of the ALB Security Group"
  type        = string
  default     = null
}

variable "env" {
  description = "Environment name (e.g., dev, prod, shared)"
  type        = string
  default     = "prod"
}