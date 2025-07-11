resource "aws_networkfirewall_firewall" "this" {
  name                = "${var.name_prefix}-firewall"
  firewall_policy_arn = aws_networkfirewall_firewall_policy.this.arn
  vpc_id              = data.terraform_remote_state.inspection_vpc.outputs.vpc_id
  subnet_mapping {
    subnet_id = data.terraform_remote_state.inspection_vpc.outputs.private_subnet_1_id
  }
  subnet_mapping {
    subnet_id = data.terraform_remote_state.inspection_vpc.outputs.private_subnet_2_id
  }

  delete_protection                 = false
  subnet_change_protection          = false
  firewall_policy_change_protection = false

  tags = var.tags
}

resource "aws_networkfirewall_firewall" "north_south" {
  name                = "${var.name_prefix}-north-south-firewall"
  firewall_policy_arn = aws_networkfirewall_firewall_policy.north_south.arn
  vpc_id              = data.terraform_remote_state.inspection_vpc.outputs.vpc_id

  subnet_mapping {
    subnet_id = data.terraform_remote_state.inspection_vpc.outputs.public_subnet_1_id
  }

  subnet_mapping {
    subnet_id = data.terraform_remote_state.inspection_vpc.outputs.public_subnet_2_id
  }

  delete_protection                 = false
  subnet_change_protection          = false
  firewall_policy_change_protection = false

  tags = var.tags
}
