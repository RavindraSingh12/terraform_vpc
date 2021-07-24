
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "azs" {
  value = module.vpc.azs 
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "default_security_group_id" {
  value = module.vpc.default_security_group_id
}

output "default_route_table_id" {
    value = module.vpc.default_route_table_id
}

output "private_route_table_ids" {
    value = module.vpc.private_route_table_ids
}

output "public_route_table_ids" {
    value = module.vpc.private_route_table_ids
}
