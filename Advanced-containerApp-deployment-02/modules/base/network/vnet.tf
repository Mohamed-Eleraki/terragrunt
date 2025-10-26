resource "azurerm_virtual_network" "eraki_common_we_vnet" {
  name = "VNET${var.host_environment_short}${var.region_short}${var.function}${var.resource_number}"
  location            = var.region
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.50.0/23", "10.0.52.0/23"]
  tags                = local.all_tags
}