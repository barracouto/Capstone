resource "aws_ssoadmin_permission_set" "admin" {
  name             = "Administrator"
  description      = "Administrator access for users"
  instance_arn     = var.identity_center_instance_arn
  session_duration = "PT8H"

  tags = {
    Environment = var.env
    Name        = "Administrator"
  }
}

resource "aws_ssoadmin_managed_policy_attachment" "admin_policy_attachment" {
  instance_arn       = var.identity_center_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.admin.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_ssoadmin_account_assignment" "admin_assignment" {
  instance_arn       = var.identity_center_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.admin.arn
  principal_id       = var.admin_group_id
  principal_type     = "GROUP"
  target_id          = var.target_account_id
  target_type        = "AWS_ACCOUNT"
}
