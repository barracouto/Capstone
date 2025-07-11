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

output "tunnel1_inside_cidr" {
  value = aws_vpn_connection.this.tunnel1_inside_cidr
}

output "tunnel1_vgw_inside_address" {
  value = aws_vpn_connection.this.tunnel1_vgw_inside_address
}

output "tunnel1_cgw_inside_address" {
  value = aws_vpn_connection.this.tunnel1_cgw_inside_address
}

output "tunnel1_psk" {
  value     = aws_vpn_connection.this.tunnel1_preshared_key
  sensitive = true
}

output "vpn_tgw_attachment_id" {
  value       = aws_vpn_connection.this.transit_gateway_attachment_id
  description = "ID of the VPN Transit Gateway Attachment"
}
