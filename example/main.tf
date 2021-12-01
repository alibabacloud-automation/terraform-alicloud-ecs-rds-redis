variable "name" {
  default = "terraform_test"
}

data "alicloud_zones" "default" {
  available_resource_creation = "KVStore"
  enable_details              = true
}

resource "alicloud_vpc" "default" {
  count = length(data.alicloud_vpcs.default.ids) > 0 ? 0 : 1
  vpc_name   = "terraform_test"
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  count = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vswitch_name = "terraform_test"
  cidr_block   = "172.16.0.0/16"
  vpc_id       = length(data.alicloud_vpcs.default.ids) > 0 ? "${data.alicloud_vpcs.default.ids.0}" : alicloud_vpc.default.0.id
  zone_id      = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_security_group" "default" {
  count = length(data.alicloud_security_groups.default.ids) > 0 ? 0 : 1
  name   = "terraform_test"
  vpc_id = length(data.alicloud_vpcs.default.ids) > 0 ? "${data.alicloud_vpcs.default.ids.0}" : alicloud_vpc.default.0.id
}

data "alicloud_vpcs" "default" {
  is_default = true
}

data "alicloud_security_groups" "default" {
  vpc_id = length(data.alicloud_vpcs.default.ids) > 0 ? "${data.alicloud_vpcs.default.ids.0}" : alicloud_vpc.default.0.id
}

data "alicloud_vswitches" "default" {
  zone_id = data.alicloud_zones.default.zones[0].id
  vpc_id =  length(data.alicloud_vpcs.default.ids) > 0 ? "${data.alicloud_vpcs.default.ids.0}" : alicloud_vpc.default.0.id
}

module "example" {
  source             = "../"
  name               = var.name
  security_group_ids = length(data.alicloud_security_groups.default.ids) > 0 ? [data.alicloud_security_groups.default.ids.0] : [alicloud_security_group.default.0.id]
  vswitch_id         = length(data.alicloud_vswitches.default.ids) > 0 ? "${data.alicloud_vswitches.default.ids.0}" : alicloud_vswitch.default.0.id
  availability_zone  = data.alicloud_zones.default.zones.0.id
}
