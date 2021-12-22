output "this_ecs_id" {
  value = alicloud_instance.default.id
}

output "this_rds_id" {
  value = alicloud_db_instance.default.id
}

output "this_redis_id" {
  value = alicloud_kvstore_instance.default.id
}

output "this_ecs_name" {
  value = alicloud_instance.default.instance_name
}

output "this_rds_name" {
  value = alicloud_db_instance.default.instance_name
}

output "this_redis_name" {
  value = alicloud_kvstore_instance.default.db_instance_name
}