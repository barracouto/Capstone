resource "aws_ssoadmin_permission_set" "readonly" {
  name             = "ReadOnly"
  description      = "ReadOnly access for users"
  instance_arn     = var.identity_center_instance_arn
  session_duration = "PT8H"

  tags = {
    Environment = var.env
    Name        = "ReadOnly"
  }
}

resource "aws_ssoadmin_managed_policy_attachment" "readonly_policy_attachment" {
  instance_arn       = var.identity_center_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.readonly.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_ssoadmin_account_assignment" "readonly_assignment" {
  instance_arn       = var.identity_center_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.readonly.arn
  principal_id       = var.readonly_group_id
  principal_type     = "GROUP"
  target_id          = var.target_account_id
  target_type        = "AWS_ACCOUNT"
}
