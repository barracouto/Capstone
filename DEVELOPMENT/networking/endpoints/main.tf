module "ssm_endpoints" {
  source = "../../../../MODULES/networking/endpoints"
  vpc_id = data.terraform_remote_state.dev_vpc.outputs.vpc_id
  region = var.region
  private_subnet_ids = [
    data.terraform_remote_state.dev_vpc.outputs.private_subnet_1_id,
    data.terraform_remote_state.dev_vpc.outputs.private_subnet_2_id
  ]
  endpoint_sg_id = data.terraform_remote_state.ssm_sg.outputs.ssm_endpoint_sg_id
  private_route_table_ids = [data.terraform_remote_state.dev_vpc.outputs.private_route_table_id ]
  env = var.env
}


resource "aws_route53_resolver_endpoint" "inbound" {
  name      = "${var.env}-resolver-inbound"
  direction = "INBOUND"
  security_group_ids = [data.terraform_remote_state.resolver_sg.outputs.resolver_sg_id]

  ip_address {
    subnet_id = data.terraform_remote_state.dev_vpc.outputs.private_subnet_1_id
  }

  ip_address {
    subnet_id = data.terraform_remote_state.dev_vpc.outputs.private_subnet_2_id
  }

  tags = {
    Name        = "${var.env}-resolver-inbound"
    Environment = var.env
  }
}

resource "aws_route53_resolver_endpoint" "outbound" {
  name      = "${var.env}-resolver-outbound"
  direction = "OUTBOUND"
  security_group_ids = [data.terraform_remote_state.resolver_sg.outputs.resolver_sg_id]

  ip_address {
    subnet_id = data.terraform_remote_state.dev_vpc.outputs.private_subnet_1_id
  }

  ip_address {
    subnet_id = data.terraform_remote_state.dev_vpc.outputs.private_subnet_2_id
  }

  tags = {
    Name        = "${var.env}-resolver-outbound"
    Environment = var.env
  }
}

