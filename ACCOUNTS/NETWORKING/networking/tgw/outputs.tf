output "tgw_id" {
  description = "ID of the Transit Gateway"
  value       = aws_ec2_transit_gateway.this.id
}

output "outgoing-tgw-rt_id" {
  value = aws_ec2_transit_gateway_route_table.outgoing-tgw-rt.id
}
