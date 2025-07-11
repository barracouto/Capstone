resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.iam_instance_profile
  user_data = var.user_data


  associate_public_ip_address = false
  source_dest_check = var.source_dest_check

  tags = {
    Name        = var.instance_name
    Environment = var.env
  }
}
