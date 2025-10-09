
terraform {
  source = "../../../modules/modules/log-analytics"
}

include {
  path = find_in_parent_folders("root.hcl")
}

dependency "resource-group" {
  config_path = "../resource-group"

  mock_outputs = {  # dummy value
    resource_group_name = "mock-rg-name"
  }
}

inputs = {
  host_environment_short = values.host_environment_short
  region_short           = values.region_short
  sysrole                = values.sysrole
  resource_number        = values.resource_number
  region                 = values.region
  # Reference to the resource group name output from the dependency
  resource_group_name    = dependency.resource-group.outputs.resource_group_name
  retention_in_days      = 30
}

