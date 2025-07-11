data "terraform_remote_state" "prod_vpc" {
  backend = "s3"
  config = {
    bucket = "prod-aws-capstone-tf-state"
    key    = "prod/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "alb_sg" {
  backend = "s3"
  config = {
    bucket = "prod-aws-capstone-tf-state"
    key    = "prod/security/alb-sg/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "cert" {
  backend = "s3"
  config = {
    bucket = "prod-aws-capstone-tf-state"
    key    = "prod/networking/acm/terraform.tfstate"
    region = "us-east-2"
  }
}