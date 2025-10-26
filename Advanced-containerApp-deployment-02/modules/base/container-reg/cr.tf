resource "azurerm_container_registry" "eraki_common_creg_we" {
  name                          = "creg${var.host_environment_short}${var.function}${var.region_short}${var.resource_number}"
  resource_group_name           = var.resource_group_name
  location                      = var.region
  sku                           = "Basic"  # Chosse from Basic, Standard, Premium
  admin_enabled                 = true
  public_network_access_enabled = true
  tags                          = local.all_tags
}

# resource "azurerm_private_endpoint" "acr_private_endpoint" {
#   name                = "eraki-acr-private-endpoint-${var.host_environment_short}-${var.sysrole}-${var.region_short}-${var.resource_number}"
#   location            = var.region
#   resource_group_name = var.resource_group_name
#   subnet_id           = var.subnet_id

#   private_service_connection {
#     name                           = "acr-connection"
#     private_connection_resource_id = azurerm_container_registry.eraki_container_registry_we.id
#     subresource_names              = ["registry"]
#     is_manual_connection           = false
#   }

#   tags = local.all_tags
# }

