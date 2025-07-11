module "dev_ec2_iam" {
  source = "../../../../MODULES/iam/instance_role"
  env    = var.env
}
