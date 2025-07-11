variable "env" {
  description = "Environment label (e.g., dev, prod, shared)"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC in the main account to attach to the Transit Gateway"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs (typically private) in the VPC for the TGW attachment"
  type        = list(string)
}
