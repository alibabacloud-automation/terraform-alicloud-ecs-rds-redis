resource "alicloud_instance" "default" {
  availability_zone          = var.availability_zone
  instance_name              = var.name
  security_groups            = var.security_group_ids
  vswitch_id                 = var.vswitch_id
  instance_type              = var.instance_type
  system_disk_category       = var.system_disk_category
  system_disk_name           = var.system_disk_name
  system_disk_description    = var.system_disk_description
  image_id                   = var.image_id
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  data_disks {
    name        = var.data_disks_name
    size        = var.ecs_size
    category    = var.category
    description = var.description
    encrypted   = var.encrypted
  }
}

resource "alicloud_db_instance" "default" {
  instance_name        = var.name
  vswitch_id           = var.vswitch_id
  engine               = var.engine
  engine_version       = var.engine_version
  instance_type        = var.rds_instance_type
  instance_storage     = var.instance_storage
  instance_charge_type = var.instance_charge_type
  monitoring_period    = var.monitoring_period
}

resource "alicloud_kvstore_instance" "default" {
  vswitch_id       = var.vswitch_id
  zone_id          = var.availability_zone
  db_instance_name = var.name
  security_ips     = var.security_ips
  instance_type    = "Redis"
  engine_version   = var.redis_engine_version
  config = {
    appendonly = var.redis_appendonly, lazyfree-lazy-eviction = var.redis_lazyfree_lazy_eviction,
  }
  resource_group_id = var.redis_resource_group_id
  instance_class    = var.redis_instance_class
}