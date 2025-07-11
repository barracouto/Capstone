resource "aws_ec2_transit_gateway" "this" {
  description                     = "Transit Gateway for ${var.env}"
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = {
    Name        = "${var.env}-tgw"
    Environment = var.env
  }
}

resource "aws_ec2_transit_gateway_route_table" "outgoing-tgw-rt" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = {
    Name        = "${var.env}-outgoing-tgw-rt"
    Environment = var.env
    Type        = "outgoing-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  subnet_ids = [
    data.terraform_remote_state.networking.outputs.private_subnet_1_id,
    data.terraform_remote_state.networking.outputs.private_subnet_2_id
  ]
  transit_gateway_id = aws_ec2_transit_gateway.this.id
  vpc_id             = data.terraform_remote_state.networking.outputs.vpc_id

  tags = {
    Name        = "${var.env}-tgw-vpc-attachment"
    Environment = var.env
  }
}

resource "aws_ec2_transit_gateway_route_table" "incoming-tgw-rt" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = {
    Name        = "${var.env}-incoming-tgw-rt"
    Environment = var.env
    Type        = "incoming-tgw-rt"
  }
}



