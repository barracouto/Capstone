data "terraform_remote_state" "dev_vpc" {
  backend = "s3"
  config = {
    bucket = "dev-aws-capstone-tf-state"
    key    = "dev/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "alb_sg" {
  backend = "s3"
  config = {
    bucket = "dev-aws-capstone-tf-state"
    key    = "dev/security/alb-sg/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "cert" {
  backend = "s3"
  config = {
    bucket = "dev-aws-capstone-tf-state"
    key    = "dev/networking/acm/terraform.tfstate"
    region = "us-east-2"
  }
}