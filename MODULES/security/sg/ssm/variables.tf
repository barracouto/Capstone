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

variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}

variable "ec2_sg_id" {
  description = "The security group ID of the EC2 instances allowed to access the SSM endpoints"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the security group"
  type        = map(string)
  default     = {}
}
