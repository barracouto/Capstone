variable "env" {
  description = "Environment name for tagging"
  type        = string
}

variable "identity_center_instance_arn" {
  description = "ARN of the IAM Identity Center (SSO) instance"
  type        = string
}

variable "developer_group_id" {
  description = "Azure AD Group ID for the Developer group"
  type        = string
}

variable "target_account_id" {
  description = "AWS account ID where the permission set will be assigned"
  type        = string
}

variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "management_role_arn" {
  description = "IAM role ARN for assuming into the Prod account"
  type        = string
}