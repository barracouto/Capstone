output "alb_arn" {
  value       = module.alb.alb_arn
  description = "ARN of the Application Load Balancer"
}

output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "DNS name of the ALB for use in DNS configuration"
}

output "https_target_group_arn" {
  value       = module.alb.https_target_group_arn
  description = "Target group ARN for HTTPS traffic"
}

output "http_target_group_arn" {
  value       = module.alb.http_target_group_arn
  description = "Target group ARN for HTTP traffic"
}

output "alb_zone_id" {
  value       = module.alb.alb_zone_id
  description = "The canonical hosted zone ID of the ALB for use in Route 53 alias records"
}
