data "terraform_remote_state" "tgw" {
  backend = "s3"
  config = {
    bucket = "networking-aws-capstone-tf-state"
    key    = "networking/vpc/tgw/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "dev-aws-capstone-tf-state"
    key    = "dev/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}
