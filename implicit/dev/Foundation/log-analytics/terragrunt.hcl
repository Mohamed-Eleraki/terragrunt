terraform {
  source = "../../../modules/modules/Foundation/log-analytics"
}

include {
  path = find_in_parent_folders("terragrunt.hcl")
}

dependency "resource-group" {
  config_path = "../resource-group"

  mock_outputs = {  # dummy value
    resource_group_name = "mock-rg-name"
  }
}

inputs = {
  host_environment_short = "d"
  region_short           = "we"
  sysrole                = "sharedapps"
  resource_number        = 01
  region                 = "West Europe"
  resource_group_name    = dependency.resource-group.outputs.resource_group_name
  retention_in_days      = 30
}
