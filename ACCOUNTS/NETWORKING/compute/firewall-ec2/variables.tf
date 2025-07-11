variable "region" {
  type    = string
  default = "us-east-2"
}

variable "env" {
  type    = string
  default = "networking-inspection"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for Amazon Linux 2"
  default     = null
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "Key pair name for SSH"
  default     = null
}

variable "private_subnet_a" {
  type        = string
  description = "Subnet ID for AZ A (private)"
  default     = null
}

variable "private_subnet_b" {
  type        = string
  description = "Subnet ID for AZ B (private)"
  default     = null
}

variable "inspection_vpc_id" {
  type        = string
  description = "VPC ID for the inspection VPC"
  default     = null
}

variable "inspection_vpc_cidr" {
  type        = string
  description = "CIDR block of the inspection VPC"
  default     = null
}

variable source_dest_check {
  type        = bool
  description = "Whether to disable source/destination check on the instance"
  default     = false
}

variable "user_data" {
  type        = string
  description = "User data script for firewall EC2 instances"
  default     = <<-EOF
    #!/bin/bash

    # Enable IP forwarding
    echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
    sysctl -p

    # Install iptables
    yum install -y iptables-services

    # Start iptables
    systemctl enable iptables
    systemctl start iptables

    # Allow return traffic by default (optional)
    iptables -P FORWARD ACCEPT
  EOF
}
