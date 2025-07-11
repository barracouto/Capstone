output "public_zone_id" {
  value       = aws_route53_zone.public.zone_id
  description = "The ID of the public Route 53 hosted zone"
}

output "app_record_fqdn" {
  value       = aws_route53_record.app.fqdn
  description = "The fully qualified domain name for the app record"
}
