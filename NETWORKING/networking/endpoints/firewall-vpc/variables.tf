variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
}

variable "env" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
  default     = "networking"
}

variable "name" {
  description = "Name of the security group"
  type        = string
  default     = "ssm-sg"
}

variable "description" {
  description = "Description of the security group"
  type        = string
  default     = "Allow HTTPS traffic for SSM interface endpoints"
}

