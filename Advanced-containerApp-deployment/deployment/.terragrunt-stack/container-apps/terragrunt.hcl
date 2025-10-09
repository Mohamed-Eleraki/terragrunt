
terraform {
  source = "../../../modules/modules/container-apps"
}

include {
  path = find_in_parent_folders("root.hcl")
}

dependency "log-analytics" {
  config_path = "../log-analytics"

  mock_outputs = {  # dummy value
    resource_group_name = "mock-la-name"
  }
}
dependency "resource-group" {
  config_path = "../resource-group"

  mock_outputs = {  # dummy value
    resource_group_name = "mock-rg-name"
  }
}
dependency "container-env" {
  config_path = "../container-env"

  mock_outputs = {  # dummy value
    container_app_environment_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.App/managedEnvironments/mock-env"
    resource_group_name = "mock-contenv-name"
    managed_environment_storage_name = "mock-storage-name"
  }
}
dependency "storage-account" {
  config_path = "../storage-account"

  mock_outputs = {  # dummy value
    storage_account_name = "mock-strage-account-name"
  }
}

inputs = {
  region                 = "westeurope"
  host_environment_short = values.host_environment_short
  region_short           = values.region_short
  sysrole                = values.sysrole
  resource_number        = values.resource_number
  capps_application_name = values.sysrole
  container_app_environment_id = dependency.container-env.outputs.container_app_environment_id
  resource_group_name    = dependency.resource-group.outputs.resource_group_name
  workload_profile_name = "Consumption"
  container-name = values.container_name
  container-image = values.container_image
  container-cpu = values.container_cpu
  container-memory = values.container_memory
  container-env-vars = try(values.container_env_vars, {})  # will be overridden by values if provided
  container_scale_rule_name = values.container_scale_rule_name
  http_concurrent_requests = values.http_concurrent_requests
  http_scale_rule_min_replicas = values.http_scale_rule_min_replicas
  http_scale_rule_max_replicas = values.http_scale_rule_max_replicas
  containerapp_volume_name  = values.containerapp_volume_name
  containerapp_storage_name = dependency.container-env.outputs.managed_environment_storage_name
  container-external-enable = values.container_external_enable
  container-target-port = values.container_target_port
  container-transport = values.container_transport
  container-latest-revision = values.container_latest_revision
  container-precentage = values.container_precentage
  allowed_ips = values.allowed_ips
}
