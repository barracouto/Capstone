module "ec2_sg" {
  source    = "../../../../MODULES/security/sg/ec2"
  env       = var.env
  vpc_id    = data.terraform_remote_state.dev_vpc.outputs.vpc_id
  alb_sg_id = data.terraform_remote_state.alb_sg.outputs.alb_sg_id
  on_prem_cidr = var.on_prem_cidr
}
