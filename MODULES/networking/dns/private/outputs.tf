output "private_zone_id" {
  value       = aws_route53_zone.this.zone_id
  description = "ID of the private Route 53 hosted zone"
}

output "private_zone_name" {
  value       = aws_route53_zone.this.name
  description = "Domain name of the private Route 53 hosted zone"
}

output "internal_api_record_fqdn" {
  value       = aws_route53_record.internal_api.fqdn
  description = "Fully qualified domain name for the internal API record"
}

output "internal_api_target_dns_name" {
  value       = var.internal_alb_dns_name
  description = "DNS name of the ALB that the internal record points to"
}
