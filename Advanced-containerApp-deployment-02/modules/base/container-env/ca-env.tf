

resource "azurerm_container_app_environment" "eraki_container_environment" {
  name                       = "cenv-${var.host_environment_short}-${var.function}-${var.region_short}-${var.resource_number}"
  location                   = var.region
  resource_group_name        = var.resource_group_name
  log_analytics_workspace_id = var.log_analytics_workspace_id

  # infrastructure_resource_group_name = azurerm_resource_group.eraki_foundation_we_rg.name
  # infrastructure_subnet_id   = azurerm_subnet.eraki_foun_netspoke_we_subnet_containerApp.id
  
  # workload_profile {
  #   name                  = "Consumption"
  #   workload_profile_type = "Consumption"
  #   maximum_count         = 1
  #   minimum_count         = 1
  # }

  tags                       = local.all_tags
}

resource "azurerm_container_app_environment_storage" "eraki_container_env_storage" {
  name                         = var.storage_account_name  # azurerm_storage_account.eraki_shared_storageaccount.name
  container_app_environment_id = azurerm_container_app_environment.eraki_container_environment.id
  account_name                 = var.storage_account_name  # azurerm_storage_account.storage_account_name.name
  share_name                   = var.storage_fileshare_name  #azurerm_storage_share.storage_fileshare_name.name
  access_key                   = var.share_storage_account_primary_access_key  # azurerm_storage_account.eraki_shared_storageaccount.primary_access_key
  access_mode                  = "ReadWrite"
}
