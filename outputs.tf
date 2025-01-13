output "this_ecs_id" {
  description = "The ID of the ECS instance."
  value       = alicloud_instance.default.id
}

output "this_rds_id" {
  description = "The ID of the RDS instance."
  value       = alicloud_db_instance.default.id
}

output "this_redis_id" {
  description = "The ID of the Redis instance."
  value       = alicloud_kvstore_instance.default.id
}

output "this_ecs_name" {
  description = "The name of the ECS instance."
  value       = alicloud_instance.default.instance_name
}

output "this_rds_name" {
  description = "The name of the RDS instance."
  value       = alicloud_db_instance.default.instance_name
}

output "this_redis_name" {
  description = "The name of the Redis instance."
  value       = alicloud_kvstore_instance.default.db_instance_name
}