data "terraform_remote_state" "dev_vpc" {
  backend = "s3"
  config = {
    bucket = "dev-aws-capstone-tf-state"
    key    = "dev/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "ssm_sg" {
  backend = "s3"
  config = {
    bucket = "dev-aws-capstone-tf-state"
    key    = "dev/security/ssm-sg/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "resolver_sg" {
  backend = "s3"
  config = {
    bucket = "dev-aws-capstone-tf-state"
    key    = "dev/security/resolver-sg/terraform.tfstate"
    region = "us-east-2"
  }
}