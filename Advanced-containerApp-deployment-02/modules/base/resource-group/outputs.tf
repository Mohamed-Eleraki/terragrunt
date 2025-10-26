##################################
# resource group output
##################################
output "resource_group_location" {
  value = azurerm_resource_group.eraki_function_we_rg.location
}
output "resource_group_name" {
  value = azurerm_resource_group.eraki_function_we_rg.name
}