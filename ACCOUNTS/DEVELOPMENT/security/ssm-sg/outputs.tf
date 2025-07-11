output "ssm_endpoint_sg_id" {
  description = "The ID of the SSM endpoint security group"
  value       = module.ssm_endpoint_sg.ssm_endpoint_sg_id
}
