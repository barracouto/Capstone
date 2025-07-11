locals {
  public_enabled = var.public_subnet_1_cidr != null && var.public_subnet_1_az != null
}
