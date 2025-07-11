resource "aws_customer_gateway" "on_prem" {
  bgp_asn    = 65000
  ip_address = var.on_prem_router_ip
  type       = "ipsec.1"
  tags = {
    Name = "${var.env}-customer-gateway"
  }
}

resource "aws_vpn_connection" "this" {
  customer_gateway_id = aws_customer_gateway.on_prem.id
  transit_gateway_id  = data.terraform_remote_state.tgw.outputs.tgw_id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = {
    Name = "${var.env}-vpn-connection"
  }
}

resource "aws_route" "to_on_prem" {
  route_table_id         = data.terraform_remote_state.vpc.outputs.private_route_table_id
  destination_cidr_block = var.on_prem_cidr
  transit_gateway_id     = data.terraform_remote_state.tgw.outputs.tgw_id
}

