resource "azurerm_container_registry" "eraki_container_registry_we" {
  name                = "creg${var.host_environment_short}${var.sysrole}${var.region_short}01"
  resource_group_name = var.resource_group_name
  location            = var.region
  sku                 = "Basic"
  admin_enabled       = false
  tags                = local.all_tags
}
