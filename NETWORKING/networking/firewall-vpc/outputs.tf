output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.this.cidr_block
}

output "private_subnet_1_id" {
  value = aws_subnet.private_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private_2.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_2.id
}

output "private_route_table_id_az1" {
  description = "ID of the private route table for AZ1"
  value       = aws_route_table.private_1_rt.id
}

output "private_route_table_id_az2" {
  description = "ID of the private route table for AZ2"
  value       = aws_route_table.private_2_rt.id
}

output "public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public.id
}

output "tgw_attachment_id" {
  description = "ID of the Transit Gateway VPC Attachment"
  value       = aws_ec2_transit_gateway_vpc_attachment.this.id
}
