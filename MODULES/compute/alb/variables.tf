variable "env" {
  type        = string
  description = "Environment name (e.g., dev or prod). Controls logic for HTTPS enforcement and listener behavior."
}

variable "internal" {
  type        = bool
  description = "Whether the ALB is internal (true) or internet-facing (false)."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to associate with the ALB."
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs for the ALB."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the ALB and target groups are deployed."
}

variable "certificate_arn" {
  type        = string
  default     = ""
  description = "ACM certificate ARN for HTTPS. If empty, the HTTPS listener will not be created."
}
