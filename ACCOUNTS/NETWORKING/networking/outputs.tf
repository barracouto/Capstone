output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_1_id" {
  value = module.vpc.private_subnet_ids[0]
}

output "private_subnet_2_id" {
  value = module.vpc.private_subnet_ids[1]
}

output "private_route_table_id" {
  description = "ID of the private route table from the VPC module"
  value       = module.vpc.private_route_table_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}
# output "public_subnet_1_id" {
#   value = module.vpc.public_subnet_ids[0]
# }

# output "public_subnet_2_id" {
#   value = module.vpc.public_subnet_ids[1]
# }

# output "nat_gateway_id" {
#   value = module.vpc.nat_gateway_id
# }

# output "internet_gateway_id" {
#   value = module.vpc.internet_gateway_id
# }
