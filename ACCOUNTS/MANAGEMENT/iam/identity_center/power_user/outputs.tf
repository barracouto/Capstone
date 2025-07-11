output "poweruser_permission_set_arn" {
  description = "ARN of the PowerUser permission set"
  value       = aws_ssoadmin_permission_set.poweruser.arn
}
