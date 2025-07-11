output "acm_validation_record_name" {
  value = tolist(aws_acm_certificate.shared.domain_validation_options)[0].resource_record_name
}

output "acm_validation_record_type" {
  value = tolist(aws_acm_certificate.shared.domain_validation_options)[0].resource_record_type
}

output "acm_validation_record_value" {
  value = tolist(aws_acm_certificate.shared.domain_validation_options)[0].resource_record_value
}

output "certificate_arn" {
  description = "The ARN of the ACM certificate to be used in ALB HTTPS listeners"
  value       = aws_acm_certificate.shared.arn
}
