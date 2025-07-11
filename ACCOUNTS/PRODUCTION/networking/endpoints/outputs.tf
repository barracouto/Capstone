output "ssm_endpoint_id" {
  value = module.ssm_endpoints.ssm_endpoint_id
}

output "ssmmessages_endpoint_id" {
  value = module.ssm_endpoints.ssmmessages_endpoint_id
}

output "ec2messages_endpoint_id" {
  value = module.ssm_endpoints.ec2messages_endpoint_id
}
