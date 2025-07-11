terraform {
  backend "s3" {
    bucket  = "dev-aws-capstone-tf-state"
    key     = "dev/compute/alb/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}
