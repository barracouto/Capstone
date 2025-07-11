module "ssm_endpoint_sg" {
  source    = "../../../../MODULES/security/sg/ssm" # adjust path as needed
  vpc_id    = data.terraform_remote_state.dev_vpc.outputs.vpc_id
  ec2_sg_id = data.terraform_remote_state.app-server-ec2-sg.outputs.ec2_sg_id

  tags = var.tags
}
