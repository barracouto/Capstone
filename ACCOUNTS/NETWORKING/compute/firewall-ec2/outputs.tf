output "firewall_a_private_ip" {
  value = module.firewall_a.private_ip
}

output "firewall_b_private_ip" {
  value = module.firewall_b.private_ip
}

output "firewall_instance_ids" {
  value = [
    module.firewall_a.instance_id,
    module.firewall_b.instance_id
  ]
}

output "security_group_id" {
  value = aws_security_group.firewall_sg.id
}

output "gwlb_target_group_arn" {
  value = aws_lb_target_group.gwlb_target_group.arn
}
