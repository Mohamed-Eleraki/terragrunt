
terraform {
  source = "../../../modules/modules/container-env"
}

include {
  path = find_in_parent_folders("root.hcl")
}

dependency "log-analytics" {
  config_path = "../log-analytics"

  mock_outputs = {  # dummy value
    resource_group_name = "mock-la-name"
    log_analytics_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.OperationalInsights/workspaces/mock-la"
  }
}

dependency "resource-group" {
  config_path = "../resource-group"

  mock_outputs = {  # dummy value
    resource_group_name = "mock-rg-name"
    resource_group_location = "westeurope"
  }
}

dependency "storage-account" {
  config_path = "../storage-account"

  mock_outputs = {  # dummy value
    storage_account_name = "mock-storage-account-name"
    file_share_name = "mock-file-share"
    storage_account_primary_access_key = "mock-access-key"
  }
}

dependency "vnet-subnet" {
  config_path = "../vnet-subnet"

  mock_outputs = {  # dummy value
    subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworks/mock-vnet/subnets/mock-subnet"
  }
}

inputs = {
  host_environment_short = values.host_environment_short
  region_short           = values.region_short
  sysrole                = values.sysrole
  resource_number        = values.resource_number
  region                 = dependency.resource-group.outputs.resource_group_location
  # Reference to the resource group name output from the dependency
  resource_group_name    = dependency.resource-group.outputs.resource_group_name
  log_analytics_id = dependency.log-analytics.outputs.log_analytics_id
  workload_profile_name = values.workload_profile_name
  workload_profile_type = values.workload_profile_type
  workload_profile_min_count = values.workload_profile_minimum_count
  workload_profile_max_count = values.workload_profile_maximum_count
  storage_account_name = dependency.storage-account.outputs.storage_account_name
  file_share_name = dependency.storage-account.outputs.file_share_name
  storage_account_access_key = dependency.storage-account.outputs.storage_account_primary_access_key
  infrastructure_subnet_id = dependency.vnet-subnet.outputs.subnet_id

}
