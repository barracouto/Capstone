variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "management_role_arn" {
  description = "IAM role ARN for assuming into the Prod account"
  type        = string
}

variable "env" {
  description = "Environment name for tagging"
  type        = string
}