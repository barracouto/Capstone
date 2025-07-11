terraform {
  backend "s3" {
    bucket  = "prod-aws-capstone-tf-state"
    key     = "prod/compute/asg/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}
