variable "env" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "alb_sg_id" {
  description = "ALB Security Group ID used as a source"
  type        = string
}

variable "on_prem_cidr" {
  description = "CIDR block used on the on-prem side"
  type        = string
}