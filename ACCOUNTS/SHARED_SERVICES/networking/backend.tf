terraform {
  backend "s3" {
    bucket  = "shared-services-aws-capstone-tf-state"
    key     = "shared-services/vpc/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}
