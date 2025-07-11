variable "env" {
  description = "Environment name (e.g., dev, prod, shared)"
  type        = string
  default     = "dev"
}

variable "on_prem_router_ip" {
  description = "Public IP address of the on-prem router"
  type        = string
}

variable "on_prem_cidr" {
  description = "CIDR block used on the on-prem side"
  type        = string
}
