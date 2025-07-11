data "terraform_remote_state" "networking_vpc" {
  backend = "s3"
  config = {
    bucket = "networking-aws-capstone-tf-state"
    key    = "networking/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}
