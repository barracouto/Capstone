variable "vpc_id" {
  description = "The ID of the VPC where the SSM endpoint SG will be created"
  type        = string
  default     = null
}

variable "ec2_sg_id" {
  description = "The security group ID of the EC2 instances that should be allowed to reach SSM endpoints"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the SSM endpoint security group"
  type        = map(string)
  default = {
    Name        = "dev-ssm-sg"
    Environment = "dev"
    ManagedBy   = "terraform"
    Purpose     = "Allow EC2 to reach SSM endpoints"
  }
}

variable "env" {
  description = "Environment name (e.g., dev, prod, shared)"
  type        = string
  default     = "dev"
}