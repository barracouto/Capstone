output "customer_gateway_id" {
  value       = aws_customer_gateway.on_prem.id
  description = "ID of the customer gateway"
}

output "vpn_connection_id" {
  value       = aws_vpn_connection.this.id
  description = "ID of the VPN connection"
}

output "tunnel1_address" {
  value = aws_vpn_connection.this.tunnel1_address
}

