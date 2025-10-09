terraform {
  source = "../../../modules/modules/vnet-subnet"
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

inputs = {
  host_environment_short = values.host_environment_short
  region_short           = values.region_short
  sysrole                = values.sysrole
  region                 = values.region
  resource_number        = values.resource_number
  resource_group_name    = dependency.resource-group.outputs.resource_group_name
  address_space          = try(values.address_space, ["10.0.0.0/16"])
  subnet_prefixes        = try(values.subnet_prefixes, ["10.0.1.0/24"])
}
