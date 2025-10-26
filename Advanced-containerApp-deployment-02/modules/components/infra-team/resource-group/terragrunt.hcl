terraform {
  source = "${get_repo_root()}/Advanced-containerApp-deployment-02/modules/base/resource-group"
}

include {
  path = find_in_parent_folders("env-config.hcl")
}

inputs = {
  host_environment_short = values.host_environment_short
  function              = values.function
  region_short           = values.region_short
  resource_number        = values.resource_number
  region                 = values.region
}