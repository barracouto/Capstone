terraform {
  backend "s3" {
    bucket  = "networking-aws-capstone-tf-state"
    key     = "networking/networking/firewall/aws-network-firewall/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}
