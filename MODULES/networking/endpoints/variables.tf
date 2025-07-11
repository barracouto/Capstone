variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs to associate with the endpoint"
  type        = list(string)
}

variable "endpoint_sg_id" {
  description = "Security group ID to associate with the VPC endpoints"
  type        = string
}

variable "private_route_table_ids" {
  description = "List of private route table IDs to attach the endpoint to"
  type        = list(string)
}

variable "env" {
  description = "Environment name (e.g. dev, prod)"
  type        = string
}