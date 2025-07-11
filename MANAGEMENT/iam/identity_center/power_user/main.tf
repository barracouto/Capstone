resource "aws_ssoadmin_permission_set" "poweruser" {
  name             = "PowerUser"
  description      = "PowerUser access for users"
  instance_arn     = var.identity_center_instance_arn
  session_duration = "PT8H"

  tags = {
    Environment = var.env
    Name        = "PowerUser"
  }
}

resource "aws_ssoadmin_managed_policy_attachment" "poweruser_policy_attachment" {
  instance_arn       = var.identity_center_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.poweruser.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_ssoadmin_account_assignment" "poweruser_assignment" {
  instance_arn       = var.identity_center_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.poweruser.arn
  principal_id       = var.poweruser_group_id
  principal_type     = "GROUP"
  target_id          = var.target_account_id
  target_type        = "AWS_ACCOUNT"
}
