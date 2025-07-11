module "ssm_endpoints" {
  source = "../../../../MODULES/networking/endpoints"
  vpc_id = data.terraform_remote_state.prod_vpc.outputs.vpc_id
  region = var.region
  private_subnet_ids = [
    data.terraform_remote_state.prod_vpc.outputs.private_subnet_1_id,
    data.terraform_remote_state.prod_vpc.outputs.private_subnet_2_id
  ]
  endpoint_sg_id = data.terraform_remote_state.ssm_sg.outputs.ssm_endpoint_sg_id
}
