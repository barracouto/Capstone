output "ssm_endpoint_id" {
  value = module.ssm_endpoints.ssm_endpoint_id
}

output "ssmmessages_endpoint_id" {
  value = module.ssm_endpoints.ssmmessages_endpoint_id
}

output "ec2messages_endpoint_id" {
  value = module.ssm_endpoints.ec2messages_endpoint_id
}

output "resolver_inbound_ips" {
  value = aws_route53_resolver_endpoint.inbound.ip_address
}

output "resolver_outbound_ips" {
  value = aws_route53_resolver_endpoint.outbound.ip_address
}