module "alb" {
  source = "../../../../MODULES/compute/alb" # Adjust path as needed

  env                = "prod"
  internal           = false
  subnet_ids         = [
    data.terraform_remote_state.prod_vpc.outputs.public_subnet_1_id,
    data.terraform_remote_state.prod_vpc.outputs.public_subnet_2_id
  ]
  security_group_ids = [data.terraform_remote_state.alb_sg.outputs.alb_sg_id]
  vpc_id             = data.terraform_remote_state.prod_vpc.outputs.vpc_id
  certificate_arn    = data.terraform_remote_state.cert.outputs.certificate_arn
}
