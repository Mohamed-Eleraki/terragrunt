resource "azurerm_user_assigned_identity" "eraki_capp_managed_identity_reg" {
  name = "mi-${var.host_environment_short}-regpull-${var.region_short}-01"
  resource_group_name = var.resource_group_name  # azurerm_resource_group.eraki_foundation_we_rg.name
  location = var.region 
}

resource "azurerm_role_assignment" "eraki_capp_mi_role_reg" {
  scope = var.container_reg_id  # azurerm_container_registry.eraki_container_registry_we.id
  role_definition_name = "AcrPull"
  principal_id = azurerm_user_assigned_identity.eraki_capp_managed_identity_reg.principal_id
}