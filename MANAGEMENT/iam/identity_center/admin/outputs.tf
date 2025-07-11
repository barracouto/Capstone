output "admin_permission_set_arn" {
  description = "ARN of the Administrator permission set"
  value       = aws_ssoadmin_permission_set.admin.arn
}
