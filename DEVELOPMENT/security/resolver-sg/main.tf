module "resolver_sg" {
  source       = "../../../../MODULES/security/sg/resolver"
  vpc_id       = data.terraform_remote_state.dev_vpc.outputs.vpc_id
  on_prem_cidr = var.on_prem_cidr
  env          = var.env
  vpc_cidr     = var.vpc_cidr 
}
