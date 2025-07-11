data "terraform_remote_state" "prod_vpc" {
  backend = "s3"
  config = {
    bucket = "prod-aws-capstone-tf-state"
    key    = "prod/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "app-server-ec2-sg" {
  backend = "s3"
  config = {
    bucket = "prod-aws-capstone-tf-state"
    key    = "prod/security/app-server-ec2-sg/terraform.tfstate"
    region = "us-east-2"
  }
}