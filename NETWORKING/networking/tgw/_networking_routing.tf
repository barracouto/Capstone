##########################
# ASSOCIATION
##########################

# NETWORKING FIREWALL ROUTE TABLE ASSOCIATION
resource "aws_ec2_transit_gateway_route_table_association" "networking_firewall-tgw-rt" { # CHECKED
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.incoming-tgw-rt.id
}


##########################
# PROPAGATION
##########################

# PROPAGATION FOR NETWORKING FIREWALL TGW RT
resource "aws_ec2_transit_gateway_route_table_propagation" "networking_firewall-tgw-rt" { # CHECKED
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.outgoing-tgw-rt.id
}


##########################
# ROUTES
##########################

# # ROUTE FOR NETWORKING FIREWALL TGW RT
# resource "aws_ec2_transit_gateway_route" "to_networking" { # CHECKED
#   destination_cidr_block         = data.terraform_remote_state.networking.outputs.vpc_cidr_block
#   transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this.id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.firewall-tgw-rt.id
# }