resource "azurerm_log_analytics_workspace" "eraki_log_analytics_we" {
  name                = "la-${var.host_environment_short}-${var.sysrole}-${var.region_short}-${var.resource_number}"
  location            = var.region
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_in_days # Minimum 30 days
  tags                = local.all_tags
}
