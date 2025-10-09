
terraform {
  source = "../../../modules/modules/storage-account"
}

include {
  path = find_in_parent_folders("root.hcl")
}

dependency "resource-group" {
  config_path = "../resource-group"
  mock_outputs = {
    resource_group_name = "mock-rg-name"
  }
  
}
dependency "vnet-subnet" {
  config_path = "../vnet-subnet"
  mock_outputs = {
    subnet_id = "mock-sub-id"
  }
  
}
inputs = {
  host_environment_short = values.host_environment_short
  region_short           = values.region_short
  sysrole                = values.sysrole
  region                 = values.region
  resource_number = values.resource_number
  resource_group_name = dependency.resource-group.outputs.resource_group_name
  subnet_id = dependency.vnet-subnet.outputs.subnet_id
}
