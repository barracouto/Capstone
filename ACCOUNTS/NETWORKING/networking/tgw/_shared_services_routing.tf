##########################
# ASSOCIATION
##########################

# SHARED MAIN ROUTE TABLE ASSOCIATION
resource "aws_ec2_transit_gateway_route_table_association" "shared_main-tgw-rt" { #CHECKED
  transit_gateway_attachment_id  = data.terraform_remote_state.shared_services_vpc.outputs.tgw_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.incoming-tgw-rt.id
}

##########################
# PROPAGATION
##########################

# #SHARED PROPAGATION TO MAIN TGW RT
# resource "aws_ec2_transit_gateway_route_table_propagation" "shared_main-tgw-rt" { # CHECKED
#   transit_gateway_attachment_id  = data.terraform_remote_state.shared_services_vpc.outputs.tgw_attachment_id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.main-tgw-rt.id
# }

# SHARED FIREWALL ROUTE TABLE PROPAGATION
resource "aws_ec2_transit_gateway_route_table_propagation" "shared_firewall-tgw-rt" { # CHECKED
  transit_gateway_attachment_id  = data.terraform_remote_state.shared_services_vpc.outputs.tgw_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.outgoing-tgw-rt.id
}

##########################
# ROUTES
##########################

# #SHARED ROUTE TO FIREWALL TGW RT
# resource "aws_ec2_transit_gateway_route" "to_shared_services" { # CHECKED
#   destination_cidr_block         = data.terraform_remote_state.shared_services_vpc.outputs.cidr_block
#   transit_gateway_attachment_id  = data.terraform_remote_state.shared_services_vpc.outputs.tgw_attachment_id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.firewall-tgw-rt.id
# }