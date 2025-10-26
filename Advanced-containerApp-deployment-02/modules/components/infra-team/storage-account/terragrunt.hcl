terraform {
  source = "${get_repo_root()}/Advanced-containerApp-deployment-02/modules/base/storage-account"
}

include {
  path = find_in_parent_folders("env-config.hcl")
}

dependency "resource-group" {
  config_path = "../app-resource-group"

  mock_outputs = {  # dummy value
    resource_group_name = "mock-rg-name"
  }
}

inputs = {
  host_environment_short = values.host_environment_short
  function              = values.function
  region_short           = values.region_short
  resource_number        = values.resource_number
  region                 = values.region
  # Reference to the resource group name output from the dependency
  resource_group_name    = dependency.resource-group.outputs.resource_group_name
}