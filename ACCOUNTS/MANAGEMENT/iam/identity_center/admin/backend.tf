terraform {
  backend "s3" {
    bucket         = "management-aws-capstone-tf-state"
    key            = "management/iam/admin/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
