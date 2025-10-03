terraform {  # while working locally prefer to pass the full path
  source = "/Users/moeraki/Documents/gitRepoDeloitte/terragrunt/explicit/demo02/modules/modules/log-analytics"
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
  resource_number        = values.resource_number
  region                 = values.region
  resource_group_name    = dependency.resource-group.outputs.resource_group_name
  retention_in_days      = 30
}
