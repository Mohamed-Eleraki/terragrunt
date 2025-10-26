
output "common_virtual_network_id" {
  description = "The ID of the common virtual network"
  value       = azurerm_virtual_network.eraki_common_we_vnet.id
}
output "common_virtual_network_name" {
  description = "The name of the common virtual network"
  value       = azurerm_virtual_network.eraki_common_we_vnet.name
}

output "common_subnet_id" {
  description = "The ID of the common subnet"
  value       = azurerm_subnet.eraki_common_we_subnet.id
}
output "common_subnet_name" {
  description = "The name of the common subnet"
  value       = azurerm_subnet.eraki_common_we_subnet.name
}
output "capp_subnet_id" {
  description = "The ID of the Container Apps subnet"
  value       = azurerm_subnet.eraki_capp_we_subnet.id
}
output "capp_subnet_name" {
  description = "The name of the Container Apps subnet"
  value       = azurerm_subnet.eraki_capp_we_subnet.name
}

output "common_nsg_id" {
  description = "The ID of the common network security group"
  value       = azurerm_network_security_group.eraki_common_we_nsg.id
}
output "common_nsg_name" {
  description = "The name of the common network security group"
  value       = azurerm_network_security_group.eraki_common_we_nsg.name
}
output "capp_nsg_id" {
  description = "The ID of the Container Apps network security group"
  value       = azurerm_network_security_group.eraki_capp_we_nsg.id
}
output "capp_nsg_name" {
  description = "The name of the Container Apps network security group"
  value       = azurerm_network_security_group.eraki_capp_we_nsg.name
}

output "common_route_table_id" {
  description = "The ID of the common route table"
  value       = azurerm_route_table.eraki_common_we_rt.id
}
output "common_route_table_name" {
  description = "The name of the common route table"
  value       = azurerm_route_table.eraki_common_we_rt.name
}
output "capp_route_table_id" {
  description = "The ID of the Container Apps route table"
  value       = azurerm_route_table.eraki_capp_we_rt.id
}
output "capp_route_table_name" {
  description = "The name of the Container Apps route table"
  value       = azurerm_route_table.eraki_capp_we_rt.name
}
output "capp_infrastructure_subnet_id" {
  description = "The ID of the subnet for Container Apps"
  value       = azurerm_subnet.eraki_capp_we_subnet.id
}
