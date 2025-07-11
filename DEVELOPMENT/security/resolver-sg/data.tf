data "terraform_remote_state" "dev_vpc" {
  backend = "s3"
  config = {
    bucket = "dev-aws-capstone-tf-state"
    key    = "dev/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}
