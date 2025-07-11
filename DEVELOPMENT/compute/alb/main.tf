module "alb" {
  source = "../../../../MODULES/compute/alb"

  env      = "dev"
  internal = true
  subnet_ids = [
    data.terraform_remote_state.dev_vpc.outputs.private_subnet_1_id,
    data.terraform_remote_state.dev_vpc.outputs.private_subnet_2_id
  ]
  security_group_ids = [data.terraform_remote_state.alb_sg.outputs.alb_sg_id]
  vpc_id             = data.terraform_remote_state.dev_vpc.outputs.vpc_id
  certificate_arn    = data.terraform_remote_state.cert.outputs.certificate_arn
}
