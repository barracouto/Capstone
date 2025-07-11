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

resource "aws_ec2_transit_gateway_route_table" "inbound" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = {
    Name        = "${var.env}-tgw-inbound-rt"
    Environment = var.env
    Type        = "inbound"
  }
}

resource "aws_ec2_transit_gateway_route_table" "outbound" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = {
    Name        = "${var.env}-tgw-outbound-rt"
    Environment = var.env
    Type        = "outbound"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  subnet_ids         = var.subnet_ids # Should be private subnets in the main VPC
  transit_gateway_id = aws_ec2_transit_gateway.this.id
  vpc_id             = var.vpc_id

  tags = {
    Name        = "${var.env}-tgw-vpc-attachment"
    Environment = var.env
  }
}

