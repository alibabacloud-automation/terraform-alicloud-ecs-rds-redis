output "this_ecs_name" {
  description = "The name of the ECS instance."
  value       = module.example.this_ecs_name
}

output "this_rds_name" {
  description = "The name of the RDS instance."
  value       = module.example.this_rds_name
}

output "this_redis_name" {
  description = "The name of the Redis instance."
  value       = module.example.this_redis_name
}
