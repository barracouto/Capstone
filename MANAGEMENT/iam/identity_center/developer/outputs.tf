output "developer_permission_set_arn" {
  description = "ARN of the Developer permission set"
  value       = aws_ssoadmin_permission_set.developer.arn
}
