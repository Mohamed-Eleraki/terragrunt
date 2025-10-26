resource "azurerm_network_security_group" "eraki_common_we_nsg" {
  name                = "nsg-d-we-common-02"
  location            = var.region
  resource_group_name = var.resource_group_name
  tags                = local.all_tags
}
resource "azurerm_network_security_group" "eraki_capp_we_nsg" {
  name                = "nsg-d-we-capp-03"
  location            = var.region
  resource_group_name = var.resource_group_name
  tags                = local.all_tags

  # Example security rule for inbound HTTP traffic to Container Apps port 80
  security_rule {
    name                       = "Allow-HTTP-Inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


