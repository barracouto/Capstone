output "asg_name" {
  value       = module.asg.asg_name
  description = "Name of the Auto Scaling Group"
}

output "launch_template_id" {
  value       = module.asg.launch_template_id
  description = "ID of the EC2 launch template used by the ASG"
}
