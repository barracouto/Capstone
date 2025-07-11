variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.2.0/24"
}

variable "env" {
  description = "Environment name (e.g., dev, prod, shared)"
  type        = string
  default     = "prod"
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "private_subnet_1_az" {
  description = "Availability Zone for private subnet 1"
  type        = string
  default     = "us-east-2a"
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for private subnet 1"
  type        = string
  default     = "10.0.2.0/26"
}

variable "private_subnet_2_az" {
  description = "Availability Zone for private subnet 2"
  type        = string
  default     = "us-east-2b"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for private subnet 2"
  type        = string
  default     = "10.0.2.64/26"
}

variable "public_subnet_1_az" {
  description = "Availability Zone for public subnet 1"
  type        = string
  default     = "us-east-2a"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
  default     = "10.0.2.128/26"
}

variable "public_subnet_2_az" {
  description = "Availability Zone for public subnet 2"
  type        = string
  default     = "us-east-2b"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
  default     = "10.0.2.192/26"
}
