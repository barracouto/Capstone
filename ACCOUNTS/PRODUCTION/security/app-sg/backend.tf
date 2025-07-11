terraform {
  backend "s3" {
    bucket  = "prod-aws-capstone-tf-state"
    key     = "prod/security/app-server-ec2-sg/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}