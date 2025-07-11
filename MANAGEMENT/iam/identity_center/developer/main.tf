resource "aws_ssoadmin_permission_set" "developer" {
  name             = "Developer"
  description      = "Developer access to infrastructure and DevOps services"
  instance_arn     = var.identity_center_instance_arn
  session_duration = "PT8H"

  tags = {
    Environment = var.env
    Name        = "Developer"
  }
}

resource "aws_ssoadmin_permission_set_inline_policy" "inline" {
  instance_arn       = var.identity_center_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.developer.arn
  inline_policy      = file("${path.module}/developer-inline-policy.json")
}

resource "aws_ssoadmin_account_assignment" "developer_assignment" {
  instance_arn       = var.identity_center_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.developer.arn
  principal_id       = var.developer_group_id
  principal_type     = "GROUP"
  target_id          = var.target_account_id
  target_type        = "AWS_ACCOUNT"
}
