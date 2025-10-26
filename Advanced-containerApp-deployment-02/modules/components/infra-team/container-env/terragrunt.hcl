terraform {
  source = "${get_repo_root()}/Advanced-containerApp-deployment-02/modules/base/container-env"
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
dependency "log-analytics" {
  config_path = "../log-analytics"

  mock_outputs = {  # dummy value
    log_analytics_workspace_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.OperationalInsights/workspaces/mock-law"
  }
}
dependency "storage-account" {
  config_path = "../storage-account"

  mock_outputs = {  # dummy value
    storage_account_name = "mockstorageaccount"
    storage_fileshare_name = "mockfileshare"
    share_storage_account_primary_access_key = "mockprimaryaccesskey"
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
  log_analytics_workspace_id = dependency.log-analytics.outputs.log_analytics_workspace_id
  log_analytics_retention = values.log_analytics_retention

  storage_account_name   = dependency.storage-account.outputs.storage_account_name
  storage_fileshare_name = dependency.storage-account.outputs.storage_fileshare_name
  share_storage_account_primary_access_key = dependency.storage-account.outputs.share_storage_account_primary_access_key
}
