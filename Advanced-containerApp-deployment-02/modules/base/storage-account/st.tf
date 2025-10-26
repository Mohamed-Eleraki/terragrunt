resource "azurerm_storage_account" "eraki_common_we_storageaccount" {
  name                     = "sa${var.host_environment_short}${var.region_short}${var.function}${var.resource_number}"
  resource_group_name      = var.resource_group_name
  location                 = var.region
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # network_rules {
  #   default_action             = "Deny"
  #   virtual_network_subnet_ids = [var.subnet_id]
  # }
  tags = local.all_tags
}

resource "azurerm_storage_share" "eraki_common_we__storageaccount_fileshare" {
  name                 = "eraki-shared-stfileshare"
  storage_account_id = azurerm_storage_account.eraki_common_we_storageaccount.id
  quota                = 1  # GB
}
