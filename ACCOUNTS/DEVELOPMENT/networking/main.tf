module "vpc" {
  source = "../../../MODULES/networking/vpc"

  cidr_block            = var.cidr_block
  env                   = var.env
  private_subnet_1_az   = var.private_subnet_1_az
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_az   = var.private_subnet_2_az
  private_subnet_2_cidr = var.private_subnet_2_cidr
  public_subnet_1_az    = var.public_subnet_1_az
  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_az    = var.public_subnet_2_az
  public_subnet_2_cidr  = var.public_subnet_2_cidr
}

resource "aws_route" "route_to_tgw" {
  route_table_id         = module.vpc.private_route_table_id 
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = data.terraform_remote_state.tgw.outputs.tgw_id
}


resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  subnet_ids         = module.vpc.private_subnet_ids
  transit_gateway_id = data.terraform_remote_state.tgw.outputs.tgw_id
  vpc_id             = module.vpc.vpc_id

  appliance_mode_support                          = "disable"
  dns_support                                     = "enable"
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = {
    Name = "${var.env}-tgw-attachment"
  }
}

# resource "aws_route" "to_on_prem" {
#   route_table_id         = module.vpc.private_route_table_id
#   destination_cidr_block = var.on_prem_cidr
#   transit_gateway_id     = data.terraform_remote_state.tgw.outputs.tgw_id
# }

# resource "aws_ec2_transit_gateway_route_table_propagation" "dev_propagates_to_outbound" {
#   transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this.id
#   transit_gateway_route_table_id = data.terraform_remote_state.tgw.outputs.outbound_rt_id
# }


