resource "azurerm_storage_account" "storage" {
  name                     = "sa${var.host_environment_short}${var.region_short}${var.sysrole}${var.resource_number}"
  resource_group_name      = var.resource_group_name
  location                 = var.region
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = [var.subnet_id]
  }

  tags = local.all_tags
}

resource "azurerm_storage_share" "fileshare" {
  name                 = "myvolume"
  storage_account_id = azurerm_storage_account.storage.id
  quota                = 1
}
