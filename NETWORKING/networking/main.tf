module "vpc" {
  source = "../../../MODULES/networking/vpc"

  cidr_block            = var.cidr_block
  env                   = var.env
  private_subnet_1_az   = var.private_subnet_1_az
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_az   = var.private_subnet_2_az
  private_subnet_2_cidr = var.private_subnet_2_cidr
  public_subnet_1_az    = var.public_subnet_1_az
  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_az    = var.public_subnet_2_az
  public_subnet_2_cidr  = var.public_subnet_2_cidr
}
