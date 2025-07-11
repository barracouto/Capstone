module "alb_sg" {
  source   = "../../../../MODULES/security/sg/alb"
  env      = var.env
  vpc_id   = data.terraform_remote_state.dev_vpc.outputs.vpc_id
  vpc_cidr = data.terraform_remote_state.dev_vpc.outputs.vpc_cidr_block
  on_prem_cidr = var.on_prem_cidr
}
