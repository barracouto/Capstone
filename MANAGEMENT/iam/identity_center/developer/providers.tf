provider "aws" {
  alias  = "prod"
  region = var.aws_region

  assume_role {
    role_arn     = var.management_role_arn
    session_name = "ManagementVpcSession"
  }

  default_tags {
    tags = {
      Environment = var.env
      ManagedBy   = "Terraform"
    }
  }
}
