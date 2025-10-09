resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.host_environment_short}-${var.sysrole}-${var.region_short}-${var.resource_number}"
  location            = var.region
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = local.all_tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "snet-${var.host_environment_short}-${var.sysrole}-${var.region_short}-${var.resource_number}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_prefixes

  service_endpoints = ["Microsoft.Storage"]

  # Delegate to Container Apps
  delegation {
    name = "Microsoft.App.environments"
    service_delegation {
      name    = "Microsoft.App/environments"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}
