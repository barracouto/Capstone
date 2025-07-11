module "resolver_sg" {
  source       = "../../../MODULES/security/sg/resolver"
  vpc_id       = data.terraform_remote_state.networking_vpc.outputs.vpc_id
  env          = var.env
  vpc_cidr     = var.vpc_cidr 
}
