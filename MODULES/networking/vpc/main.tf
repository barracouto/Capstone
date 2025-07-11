resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name        = "${var.env}-vpc"
    Environment = var.env
  }
}

resource "aws_internet_gateway" "this" {
  count  = local.public_enabled ? 1 : 0
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "${var.env}-igw"
    Environment = var.env
  }
}

resource "aws_subnet" "public_1" {
  count = local.public_enabled ? 1 : 0
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = var.public_subnet_1_az
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.env}-public-subnet-1"
    Environment = var.env
  }
}

resource "aws_subnet" "public_2" {
  count = local.public_enabled ? 1 : 0
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = var.public_subnet_2_az
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.env}-public-subnet-2"
    Environment = var.env
  }
}

resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.private_subnet_1_cidr
  availability_zone       = var.private_subnet_1_az
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.env}-private-subnet-1"
    Environment = var.env
  }
}

resource "aws_subnet" "private_2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.private_subnet_2_cidr
  availability_zone       = var.private_subnet_2_az
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.env}-private-subnet-2"
    Environment = var.env
  }
}

resource "aws_eip" "nat" {
  count = local.public_enabled ? 1 : 0

  tags = {
    Name        = "${var.env}-nat-eip"
    Environment = var.env
  }
}

resource "aws_nat_gateway" "this" {
  count         = local.public_enabled ? 1 : 0
  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public_1[0].id

  tags = {
    Name        = "${var.env}-nat-gw"
    Environment = var.env
  }

  depends_on = [aws_internet_gateway.this]
}

resource "aws_route_table" "public" {
  count  = local.public_enabled ? 1 : 0
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "${var.env}-public-rt"
    Environment = var.env
  }
}

resource "aws_route" "public_internet_access" {
  count                  = local.public_enabled ? 1 : 0
  route_table_id         = aws_route_table.public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[0].id

  depends_on = [aws_internet_gateway.this]
}

resource "aws_route_table_association" "public_1" {
  count          = local.public_enabled ? 1 : 0
  subnet_id      = aws_subnet.public_1[0].id
  route_table_id = aws_route_table.public[0].id
}

resource "aws_route_table_association" "public_2" {
  count          = local.public_enabled ? 1 : 0
  subnet_id      = aws_subnet.public_2[0].id
  route_table_id = aws_route_table.public[0].id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "${var.env}-private-rt"
    Environment = var.env
  }
}

resource "aws_route" "private_nat_gateway" {
  count                  = local.public_enabled ? 1 : 0
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this[0].id

  depends_on = [aws_nat_gateway.this]
}

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
}
