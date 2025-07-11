output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_1_id" {
  value = module.vpc.private_subnet_ids[0]
}

output "private_subnet_2_id" {
  value = module.vpc.private_subnet_ids[1]
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "private_route_table_id" {
  description = "ID of the private route table from the VPC module"
  value       = module.vpc.private_route_table_id
}

output "tgw_attachment_id" {
  description = "ID of the Transit Gateway VPC Attachment"
  value       = aws_ec2_transit_gateway_vpc_attachment.this.id
}