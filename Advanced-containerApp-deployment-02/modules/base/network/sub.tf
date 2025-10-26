resource "azurerm_subnet" "eraki_common_we_subnet" {
  name = "snet${var.host_environment_short}${var.region_short}${var.function}${var.resource_number}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.eraki_common_we_vnet.name
  address_prefixes     = ["10.0.50.0/25"]
  private_endpoint_network_policies = "NetworkSecurityGroupEnabled"
  private_link_service_network_policies_enabled = true
}

resource "azurerm_subnet" "eraki_capp_we_subnet" {
  name = "snet${var.host_environment_short}${var.region_short}${var.function}${var.resource_number}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.eraki_common_we_vnet.name
  address_prefixes     = ["10.0.52.0/23"]

  # # Delegate to Container Apps
  # delegation {
  #   name = "Microsoft.App.environments"
  #   service_delegation {
  #     name    = "Microsoft.App/environments"
  #     actions = [
  #       "Microsoft.Network/virtualNetworks/subnets/join/action"
  #     ]
  #   }
  # }
}
