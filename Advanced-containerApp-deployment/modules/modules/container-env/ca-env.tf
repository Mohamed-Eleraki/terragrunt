resource "azurerm_container_app_environment" "eraki_capp_environment_we" {
  name                       = "cenv-${var.host_environment_short}-${var.sysrole}-${var.region_short}-${var.resource_number}"
  location                   = var.region
  resource_group_name        = var.resource_group_name
  log_analytics_workspace_id = var.log_analytics_id
  infrastructure_subnet_id   = var.infrastructure_subnet_id
  workload_profile {
    name                  = var.workload_profile_name
    workload_profile_type = var.workload_profile_type
    maximum_count         = var.workload_profile_min_count
    minimum_count         = var.workload_profile_max_count
  }
  tags                       = local.all_tags
}

resource "azurerm_container_app_environment_storage" "eraki_capp_env_storage" {
  name                         = var.storage_account_name
  container_app_environment_id = azurerm_container_app_environment.eraki_capp_environment_we.id
  account_name                 = var.storage_account_name
  share_name                   = var.file_share_name
  access_key                   = var.storage_account_access_key
  access_mode                  = "ReadWrite"
}
