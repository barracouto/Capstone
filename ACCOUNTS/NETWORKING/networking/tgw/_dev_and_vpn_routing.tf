##########################
# ASSOCIATION
##########################

# DEV MAIN ROUTE TABLE ASSOCIATION
resource "aws_ec2_transit_gateway_route_table_association" "dev_main-tgw-rt" { #CHECKED
  transit_gateway_attachment_id  = data.terraform_remote_state.dev_vpc.outputs.tgw_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.incoming-tgw-rt.id
}

# VPN MAIN ROUTE TABLE ASSOCIATION
resource "aws_ec2_transit_gateway_route_table_association" "vpn_main-tgw-rt" { #CHECKED
  transit_gateway_attachment_id  = data.terraform_remote_state.vpn.outputs.vpn_tgw_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.incoming-tgw-rt.id
}



##########################
# Propagation
##########################

# # DEV PROPAGATION TO MAIN TGW RT
# resource "aws_ec2_transit_gateway_route_table_propagation" "dev_main-tgw-rt" { # CHECKED
#   transit_gateway_attachment_id  = data.terraform_remote_state.dev_vpc.outputs.tgw_attachment_id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.main-tgw-rt.id
# }

# #VPN PROPAGATION TO MAIN TGW RT
# resource "aws_ec2_transit_gateway_route_table_propagation" "vpn_main-tgw-rt" { #CHECKED
#   transit_gateway_attachment_id  = data.terraform_remote_state.vpn.outputs.vpn_tgw_attachment_id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.main-tgw-rt.id
# }

# DEV FIREWALL ROUTE TABLE PROPAGATION
resource "aws_ec2_transit_gateway_route_table_propagation" "dev_firewall-tgw-rt" { #CHECKED
  transit_gateway_attachment_id  = data.terraform_remote_state.dev_vpc.outputs.tgw_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.outgoing-tgw-rt.id
}

# VPN FIREWALL ROUTE TABLE PROPAGATION
resource "aws_ec2_transit_gateway_route_table_propagation" "vpn_firewall-tgw-rt" { #CHECKED
  transit_gateway_attachment_id  = data.terraform_remote_state.vpn.outputs.vpn_tgw_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.outgoing-tgw-rt.id
}

##########################
# ROUTES
##########################

# # DEV ROUTE TO FIREWALL TGW RT
# resource "aws_ec2_transit_gateway_route" "to_dev" { # CHECKED
#   destination_cidr_block         = data.terraform_remote_state.dev_vpc.outputs.vpc_cidr_block
#   transit_gateway_attachment_id  = data.terraform_remote_state.dev_vpc.outputs.tgw_attachment_id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.firewall-tgw-rt.id
# }

# # VPN ROUTE TO FIREWALL TGW RT
# resource "aws_ec2_transit_gateway_route" "to_on_prem" { # CHECKED
#   destination_cidr_block         = var.on_prem_cidr
#   transit_gateway_attachment_id  = data.terraform_remote_state.vpn.outputs.vpn_tgw_attachment_id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.firewall-tgw-rt.id
# }


