resource "azurerm_resource_group" "eraki_containerApps_we_rg" {
  name     = "RG-${var.host_environment_short}-${var.region_short}-${var.sysrole}"
  location = var.region
  tags     = local.all_tags
}
