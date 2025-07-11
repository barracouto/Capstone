output "resolver_sg_id" {
  description = "The ID of the SSM endpoint security group"
  value       = module.resolver_sg.resolver_sg_id
}
