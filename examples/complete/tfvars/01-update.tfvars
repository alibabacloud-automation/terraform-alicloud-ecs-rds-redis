#alicloud_instance
name                       = "update-tf-test-ecs-rds-redis"
system_disk_name           = "test_system_disk"
system_disk_description    = "test_system_disk_description"
internet_max_bandwidth_out = "20"

#alicloud_db_instance
instance_storage  = "50"
monitoring_period = "5"

#alicloud_kvstore_instance
security_ips                 = ["10.23.12.24"]
redis_engine_version         = "5.0"
redis_appendonly             = "no"
redis_lazyfree_lazy_eviction = "no"