terraform {
  backend "s3" {
    bucket  = "networking-aws-capstone-tf-state"
    key     = "networking/networking/firewall/vpc/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}
