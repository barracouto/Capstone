output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "List of public subnet IDs (if created)"
  value       = local.public_enabled ? [
    aws_subnet.public_1[0].id,
    aws_subnet.public_2[0].id
  ] : []
}


output "private_subnet_ids" {
  value = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway (if created)"
  value       = local.public_enabled ? aws_internet_gateway.this[0].id : null
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway (if created)"
  value       = local.public_enabled ? aws_nat_gateway.this[0].id : null
}

output "public_route_table_id" {
  description = "ID of the public route table (if created)"
  value       = local.public_enabled ? aws_route_table.public[0].id : null
}

output "private_route_table_id" {
  value = aws_route_table.private.id
}
