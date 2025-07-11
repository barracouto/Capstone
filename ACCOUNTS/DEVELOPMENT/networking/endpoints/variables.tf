
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = null
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
  default     = null
}

variable "endpoint_sg_id" {
  description = "Security group ID for the endpoint"
  type        = string
  default     = null
}

variable "env" {
  description = "Environment name (e.g., dev, prod, shared)"
  type        = string
  default     = "dev"
}

variable "private_route_table_ids" {
  description = "List of private route table IDs to attach the endpoint to"
  type        = list(string)
  default     = null
}