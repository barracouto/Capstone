variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "aws-capstone"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "Networking-firewall"
    Project     = "AWS Capstone"
    ManagedBy   = "Terraform"
  }
}

variable "prod_vpc_cidr" {}
variable "dev_vpc_cidr" {}
variable "shared_services_vpc_cidr" {}
variable "vpn_cidr" {}
variable "networking_vpc_cidr" {}

variable "env" {
  description = "Environment for the resources"
  type        = string
  default     = "Networking-firewall"
}

variable "region" {
  description = "AWS region for the resources"
  type        = string
  default     = "us-east-2"
}