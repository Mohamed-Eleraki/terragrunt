terraform {
  source = "."
}

include {
  path = "../../root.hcl"
}

dependency "resource-group" {
  config_path = "../resource-group"

  mock_outputs = {
    resource_group_name = "mock-rg-name"
  }
}

inputs = {
  host_environment_short = "d"
  region_short           = "we"
  sysrole                = "sharedapps"
  resource_number        = "01"
  region                 = "West Europe"
  resource_group_name    = dependency.resource-group.outputs.resource_group_name
  retention_in_days      = 30
}
