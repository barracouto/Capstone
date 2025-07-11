terraform {
  backend "s3" {
    bucket  = "dev-aws-capstone-tf-state"
    key     = "dev/security/resolver-sg/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}