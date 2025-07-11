module "firewall_a" {
  source               = "../../../../MODULES/compute/ec2"
  ami_id               = data.aws_ami.latest_amazon_linux_2.id
  instance_type        = var.instance_type
  subnet_id            = data.terraform_remote_state.firewall_vpc.outputs.private_subnet_1_id
  security_group_id    = aws_security_group.firewall_sg.id
  iam_instance_profile = module.prod_ec2_iam.instance_profile_name
  instance_name        = "${var.env}-firewall-a"
  env                  = var.env
  visibility           = "private"
  source_dest_check  = var.source_dest_check
}

module "firewall_b" {
  source               = "../../../../MODULES/compute/ec2"
  ami_id               = data.aws_ami.latest_amazon_linux_2.id
  instance_type        = var.instance_type
  subnet_id            = data.terraform_remote_state.firewall_vpc.outputs.private_subnet_2_id
  security_group_id    = aws_security_group.firewall_sg.id
  iam_instance_profile = module.prod_ec2_iam.instance_profile_name
  instance_name        = "${var.env}-firewall-b"
  env                  = var.env
  visibility           = "private"
  source_dest_check = var.source_dest_check
}

