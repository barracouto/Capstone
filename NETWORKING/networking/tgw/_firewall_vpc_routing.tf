##########################
# ASSOCIATION
##########################

# Attach the firewall VPC's TGW attachment to the firewall's TGW route table
resource "aws_ec2_transit_gateway_route_table_association" "firewall-tgw-rt" { # CHECKED
  transit_gateway_attachment_id  = data.terraform_remote_state.firewall_vpc.outputs.tgw_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.outgoing-tgw-rt.id
}


##########################
# PROPAGATION
##########################

# WE DO NOT PROPAGATE TO THE MAIN TGW RT
# WE DO NOT PROPAGATE TO THE FIREWALL TGW RT


##########################
# ROUTES
##########################

# FORCE ALL EGRESS AND INTER-VPC TRAFFIC THROUGH THE FIREWALL
resource "aws_ec2_transit_gateway_route" "to_firewall" { # CHECKED
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = data.terraform_remote_state.firewall_vpc.outputs.tgw_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.incoming-tgw-rt.id
}




