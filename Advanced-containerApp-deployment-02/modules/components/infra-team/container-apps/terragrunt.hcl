terraform {
  source = "${get_repo_root()}/Advanced-containerApp-deployment-02/modules/base/container-apps"
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
dependency "container-env" {
  config_path = "../container-env"

  mock_outputs = {  # dummy value
    container_app_environment_id = "mock-container-app-environment-id"
  }
}
dependency "container-reg" {
  config_path = "../container-reg"

  mock_outputs = {  # dummy value
    container_reg_login_server = "mock-container-reg-id"
    container_reg_id           = "mock-container-reg-login-server"
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
  container_app_environment_id = dependency.container-env.outputs.container_app_environment_id
  managed_environment_storage_name = dependency.container-env.outputs.managed_environment_storage_name

  container_name         = values.container_name
  image_uri              = values.image_uri
  target_port            = values.target_port

  container_reg_id         = dependency.container-reg.outputs.container_reg_id
  container_reg_login_server = dependency.container-reg.outputs.container_reg_login_server
}