variable "vpc_id" {
  description = "ID of the VPC where GWLB endpoint will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for deploying GWLBe (one per AZ)"
  type        = list(string)
}

variable "gwlb_service_name" {
  description = "Service name for the GWLB (e.g., com.amazonaws.vpce.us-east-2.vpce-svc-xxxx)"
  type        = string
}

variable "security_group_ids" {
  description = "Optional list of security group IDs for the GWLBe. If not provided, one will be created."
  type        = list(string)
  default     = null
}

variable "name_prefix" {
  description = "Prefix for naming module resources"
  type        = string
}

variable "env" {
  description = "Environment name (e.g., dev, prod, shared)"
  type        = string
}
