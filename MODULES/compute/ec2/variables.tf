variable "ami_id" {
  type        = string
  description = "AMI ID to use for EC2 instance"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Instance type"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to launch the instance into"
}

variable "security_group_id" {
  type        = string
  description = "Security group to associate with instance"
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM instance profile name to use with EC2"
}

variable "instance_name" {
  type        = string
  description = "Name tag for the instance"
}

variable "env" {
  type        = string
  description = "Environment name for tagging (e.g., dev, prod)"
}

variable "visibility" {
  description = "Whether the EC2 instance is in a public or private subnet"
  type        = string
  default     = "private"
}

variable "key_name" {
  type        = string
  description = "Key pair name for SSH access to the instance"
  default = null
}


variable source_dest_check {
  type        = bool
  description = "Whether to disable source/destination check on the instance"
  default     = true
}

variable user_data {
  type        = string
  description = "User data script to run on instance launch"
  default     = null
}