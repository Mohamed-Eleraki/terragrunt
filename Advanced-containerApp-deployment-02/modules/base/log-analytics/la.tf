
resource "azurerm_log_analytics_workspace" "eraki_common_loganalytics" {
  name                = "la-${var.host_environment_short}-${var.function}-${var.region_short}-${var.resource_number}"
  location            = var.region
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = var.log_analytics_retention # Minimum 30 days
  tags                = local.all_tags
}
