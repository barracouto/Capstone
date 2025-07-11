output "tgw_id" {
  description = "Transit Gateway ID"
  value       = aws_ec2_transit_gateway.this.id
}

output "tgw_route_table_inbound_id" {
  description = "TGW route table ID for inbound routing"
  value       = aws_ec2_transit_gateway_route_table.inbound.id
}

output "tgw_route_table_outbound_id" {
  description = "TGW route table ID for outbound routing"
  value       = aws_ec2_transit_gateway_route_table.outbound.id
}
