data "terraform_remote_state" "networking" {
  backend = "s3"
  config = {
    bucket = "networking-aws-capstone-tf-state"
    key    = "networking/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "vpn" {
  backend = "s3"
  config = {
    bucket = "networking-aws-capstone-tf-state"
    key    = "networking/networking/vpn/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "dev_vpc" {
  backend = "s3"
  config = {
    bucket = "dev-aws-capstone-tf-state"
    key    = "dev/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "prod_vpc" {
  backend = "s3"
  config = {
    bucket = "prod-aws-capstone-tf-state"
    key    = "prod/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "shared_services_vpc" {
  backend = "s3"
  config = {
    bucket = "shared-services-aws-capstone-tf-state"
    key    = "shared-services/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "firewall_vpc" {
  backend = "s3"
  config = {
    bucket = "networking-aws-capstone-tf-state"
    key    = "networking/networking/firewall/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}

