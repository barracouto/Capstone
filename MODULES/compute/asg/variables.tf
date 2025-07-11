variable "env" {
  type        = string
  description = "Environment name"
}

variable "ami_id" {
  type        = string
  description = "AMI ID to launch"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "Key pair name for SSH access"
  default     = ""
}

variable "user_data" {
  type        = string
  description = "User data script for EC2"
  default     = ""
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "instance_profile_name" {
  type        = string
  description = "IAM instance profile name for EC2"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for ASG"
}

variable "desired_capacity" {
  type        = number
  description = "Desired capacity for ASG"
}

variable "max_size" {
  type        = number
  description = "Max capacity for ASG"
}

variable "min_size" {
  type        = number
  description = "Min capacity for ASG"
}

variable "http_target_group_arn" {
  type        = string
  description = "HTTP target group ARN"
}

variable "https_target_group_arn" {
  type        = string
  description = "HTTPS target group ARN"
  default     = ""
}
