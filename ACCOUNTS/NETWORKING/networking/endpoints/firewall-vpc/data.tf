data "terraform_remote_state" "networking" {
  backend = "s3"
  config = {
    bucket  = "networking-aws-capstone-tf-state"
    key     = "networking/networking/firewall/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}