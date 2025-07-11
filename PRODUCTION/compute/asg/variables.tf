variable "env" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
  default     = "prod"
}

variable "visibility" {
  description = "Visibility of the EC2 instance (e.g., public, private)"
  type        = string
  default     = "public"
}

variable "instance_type" {
  description = "Instance type for the dev EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  type        = string
  description = "AMI ID to launch"
  default     = null
}

variable "key_name" {
  type        = string
  description = "Key pair name for SSH access"
  default     = "capstone-prod-kp"
}

variable "user_data" {
  type        = string
  description = "User data script for EC2"
  default     = null
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
  default     = null
}

variable "instance_profile_name" {
  type        = string
  description = "IAM instance profile name for EC2"
  default     = null
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for ASG"
  default     = null
}

variable "desired_capacity" {
  type        = number
  description = "Desired capacity for ASG"
  default     = 2
}

variable "max_size" {
  type        = number
  description = "Max capacity for ASG"
  default     = 4
}

variable "min_size" {
  type        = number
  description = "Min capacity for ASG"
  default     = 1
}

variable "http_target_group_arn" {
  type        = string
  description = "HTTP target group ARN"
  default     = ""
}

variable "https_target_group_arn" {
  type        = string
  description = "HTTPS target group ARN"
  default     = ""
}