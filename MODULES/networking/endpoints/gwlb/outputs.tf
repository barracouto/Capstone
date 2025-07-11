output "endpoint_id_az1" {
  description = "GWLBe ID in AZ1"
  value       = aws_vpc_endpoint.gwlbe[0].id
}

output "endpoint_id_az2" {
  description = "GWLBe ID in AZ2"
  value       = aws_vpc_endpoint.gwlbe[1].id
}

output "endpoint_ids_map" {
  description = "Map of endpoint IDs keyed by subnet ID"
  value = {
    for idx, sid in var.subnet_ids : sid => aws_vpc_endpoint.gwlbe[idx].id
  }
}


