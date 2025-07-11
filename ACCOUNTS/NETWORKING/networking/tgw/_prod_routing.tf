##########################
# ASSOCIATION
##########################

# Attach the production VPC's TGW attachment to the main TGW route table
resource "aws_ec2_transit_gateway_route_table_association" "prod_main-tgw-rt" { # CHECKED
  transit_gateway_attachment_id  = data.terraform_remote_state.prod_vpc.outputs.tgw_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.incoming-tgw-rt.id
}


##########################
# Propagation
##########################

# # PROD PROPAGATION TO MAIN TGW RT
# resource "aws_ec2_transit_gateway_route_table_propagation" "prod_main-tgw-rt" { # CHECKED
#   transit_gateway_attachment_id  = data.terraform_remote_state.prod_vpc.outputs.tgw_attachment_id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.main-tgw-rt.id
# }

# PROD FIREWALL ROUTE TABLE PROPAGATION
resource "aws_ec2_transit_gateway_route_table_propagation" "prod_firewall-tgw-rt" { # CHECKED
  transit_gateway_attachment_id  = data.terraform_remote_state.prod_vpc.outputs.tgw_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.outgoing-tgw-rt.id
}

##########################
# ROUTES
##########################

# # Firewall route for production VPC
# resource "aws_ec2_transit_gateway_route" "to_prod" { # CHECKED
#   destination_cidr_block         = data.terraform_remote_state.prod_vpc.outputs.vpc_cidr_block
#   transit_gateway_attachment_id  = data.terraform_remote_state.prod_vpc.outputs.tgw_attachment_id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.firewall-tgw-rt.id
# }





