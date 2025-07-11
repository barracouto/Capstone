output "ssm_endpoint_sg_id" {
  description = "The ID of the SSM endpoint security group"
  value       = aws_security_group.this.id
}
