output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The VPC id"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "The private subnets id"
}

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "The public subnets id"
}

output "vpc_cidr_block" {
  value       = local.local_data.environment.inputs.vpc_cidr
  description = "The VPC id"
}

