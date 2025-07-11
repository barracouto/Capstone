terraform {
  backend "s3" {
    bucket  = "networking-aws-capstone-tf-state"
    key     = "networking/vpc/ssm-endpoints/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}


