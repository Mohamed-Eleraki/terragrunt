resource "azurerm_route_table" "eraki_common_we_rt" {
  name                = "rt-d-we-common-01"
  location            = var.region
  resource_group_name = var.resource_group_name
  bgp_route_propagation_enabled = false
  tags                = local.all_tags
}
resource "azurerm_route_table" "eraki_capp_we_rt" {
  name                = "rt-d-we-capp-01"
  location            = var.region
  resource_group_name = var.resource_group_name
  bgp_route_propagation_enabled = false
  tags                = local.all_tags
}

resource "azurerm_subnet_route_table_association" "eraki_common_we_rt_association" {
  subnet_id      = azurerm_subnet.eraki_common_we_subnet.id
  route_table_id = azurerm_route_table.eraki_common_we_rt.id
}
resource "azurerm_subnet_route_table_association" "eraki_capp_we_rt_association" {
  subnet_id      = azurerm_subnet.eraki_capp_we_subnet.id
  route_table_id = azurerm_route_table.eraki_capp_we_rt.id
}