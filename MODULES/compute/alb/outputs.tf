output "alb_arn" {
  value       = aws_lb.this.arn
  description = "ARN of the Application Load Balancer."
}

output "alb_dns_name" {
  value       = aws_lb.this.dns_name
  description = "DNS name of the ALB to use in Route 53 or GoDaddy."
}

output "https_target_group_arn" {
  value       = aws_lb_target_group.https.arn
  description = "ARN of the target group for HTTPS (port 443) traffic."
}

output "http_target_group_arn" {
  value       = var.env == "dev" ? aws_lb_target_group.http[0].arn : null
  description = "ARN of the target group for HTTP (port 80) traffic. Only available in dev."
}

output "alb_zone_id" {
  value       = aws_lb.this.zone_id
  description = "The canonical hosted zone ID of the ALB for use in Route 53 alias records"
}