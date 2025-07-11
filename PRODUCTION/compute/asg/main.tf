module "asg" {
  source = "../../../../MODULES/compute/asg"

  env           = var.env
  ami_id        = data.aws_ami.latest_amazon_linux_2.id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = templatefile("${path.module}/user_data.sh.tpl", {
    env        = var.env
    visibility = var.visibility
  })

  security_group_ids    = [data.terraform_remote_state.app-server-ec2-sg.outputs.ec2_sg_id]
  instance_profile_name = module.prod_ec2_iam.instance_profile_name

  subnet_ids = [
    data.terraform_remote_state.prod_vpc.outputs.private_subnet_1_id,
    data.terraform_remote_state.prod_vpc.outputs.private_subnet_2_id
  ]

  desired_capacity       = var.desired_capacity
  min_size               = var.min_size
  max_size               = var.max_size
  http_target_group_arn  = "" # dev-only
  https_target_group_arn = data.terraform_remote_state.prod_alb.outputs.https_target_group_arn
}
