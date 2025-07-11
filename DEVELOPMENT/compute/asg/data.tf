data "terraform_remote_state" "app-server-ec2-sg" {
  backend = "s3"
  config = {
    bucket = "dev-aws-capstone-tf-state"
    key    = "dev/security/app-server-ec2-sg/terraform.tfstate"
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


data "terraform_remote_state" "dev_alb" {
  backend = "s3"
  config = {
    bucket = "dev-aws-capstone-tf-state"
    key    = "dev/compute/alb/terraform.tfstate"
    region = "us-east-2"
  }
}

    