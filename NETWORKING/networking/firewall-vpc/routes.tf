# PUBLIC ROUTE TABLE

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "${var.env}-public-rt"
    Environment = var.env
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id 
  route_table_id = aws_route_table.public.id 
}


# PRIVATE ROUTE TABLES

resource "aws_route_table" "private_1_rt" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "${var.env}-private-rt-az1"
    Environment = var.env
  }
}

resource "aws_route_table_association" "private_1_assoc" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_1_rt.id
}

resource "aws_route_table" "private_2_rt" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "${var.env}-private-rt-az2"
    Environment = var.env
  }
}

resource "aws_route_table_association" "private_2_assoc" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_2_rt.id
}

# Routes for private_1_rt

resource "aws_route" "private_1_to_prod" {
  route_table_id         = aws_route_table.private_1_rt.id
  destination_cidr_block = var.prod_vpc_cidr
  vpc_endpoint_id        = var.gwlbe_endpoint_az1
}

resource "aws_route" "private_1_to_dev" {
  route_table_id         = aws_route_table.private_1_rt.id
  destination_cidr_block = var.dev_vpc_cidr
  vpc_endpoint_id        = var.gwlbe_endpoint_az1
}

resource "aws_route" "private_1_to_shared" {
  route_table_id         = aws_route_table.private_1_rt.id
  destination_cidr_block = var.shared_services_vpc_cidr
  vpc_endpoint_id        = var.gwlbe_endpoint_az1
}

resource "aws_route" "private_1_to_vpn" {
  route_table_id         = aws_route_table.private_1_rt.id
  destination_cidr_block = var.vpn_cidr
  vpc_endpoint_id        = var.gwlbe_endpoint_az1
}

resource "aws_route" "private_1_to_networking" {
  route_table_id         = aws_route_table.private_1_rt.id
  destination_cidr_block = var.networking_vpc_cidr
  vpc_endpoint_id        = var.gwlbe_endpoint_az1
}

resource "aws_route" "private_1_default_to_nat" {
  route_table_id         = aws_route_table.private_1_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}

# Routes for private_2_rt

resource "aws_route" "private_2_to_prod" {
  route_table_id         = aws_route_table.private_2_rt.id
  destination_cidr_block = var.prod_vpc_cidr
  vpc_endpoint_id        = var.gwlbe_endpoint_az2
}

resource "aws_route" "private_2_to_dev" {
  route_table_id         = aws_route_table.private_2_rt.id
  destination_cidr_block = var.dev_vpc_cidr
  vpc_endpoint_id        = var.gwlbe_endpoint_az2
}

resource "aws_route" "private_2_to_shared" {
  route_table_id         = aws_route_table.private_2_rt.id
  destination_cidr_block = var.shared_services_vpc_cidr
  vpc_endpoint_id        = var.gwlbe_endpoint_az2
}

resource "aws_route" "private_2_to_vpn" {
  route_table_id         = aws_route_table.private_2_rt.id
  destination_cidr_block = var.vpn_cidr
  vpc_endpoint_id        = var.gwlbe_endpoint_az2
}

resource "aws_route" "private_2_to_networking" {
  route_table_id         = aws_route_table.private_2_rt.id
  destination_cidr_block = var.networking_vpc_cidr
  vpc_endpoint_id        = var.gwlbe_endpoint_az2
}

resource "aws_route" "private_2_default_to_nat" {
  route_table_id         = aws_route_table.private_2_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}
