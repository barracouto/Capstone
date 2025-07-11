output "readonly_permission_set_arn" {
  description = "ARN of the ReadOnly permission set"
  value       = aws_ssoadmin_permission_set.readonly.arn
}
