data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "eraki_common_keyvaultwe" {
  name                        = "kv-${var.host_environment_short}-${var.function}-${var.region_short}-${var.resource_number}"
  location                    = var.region  # azurerm_resource_group.eraki_foundation_we_rg.location
  resource_group_name         = var.resource_group_name  # azurerm_resource_group.eraki_foundation_we_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 90
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "Create",
      "Decrypt",
      "Encrypt",
      "Delete",
      "Import",
      "List",
      "Purge",
      "Recover",
      "Restore", 
      "Sign", 
      "UnwrapKey", 
      "Update", 
      "Verify", 
      "WrapKey", 
      "Release", 
      "Rotate", 
      "GetRotationPolicy",
      "SetRotationPolicy"
    ]

    secret_permissions = [
      "Get",
      "Backup", 
      "Delete", 
      "List", 
      "Purge", 
      "Recover", 
      "Restore",
       "Set"
    ]

    storage_permissions = [
      "Get",
      "Backup", 
      "Delete", 
      "DeleteSAS", 
      "GetSAS", 
      "List", 
      "ListSAS", 
      "Purge", 
      "Recover", 
      "RegenerateKey", 
      "Restore", 
      "Set", 
      "SetSAS",
      "Update"
    ]
  }
}