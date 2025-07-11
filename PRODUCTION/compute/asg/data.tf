data "terraform_remote_state" "app-server-ec2-sg" {
  backend = "s3"
  config = {
    bucket = "prod-aws-capstone-tf-state"
    key    = "prod/security/app-server-ec2-sg/terraform.tfstate"
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

data "aws_ami" "latest_amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}


data "terraform_remote_state" "prod_alb" {
  backend = "s3"
  config = {
    bucket = "prod-aws-capstone-tf-state"
    key    = "prod/compute/alb/terraform.tfstate"
    region = "us-east-2"
  }
}

    