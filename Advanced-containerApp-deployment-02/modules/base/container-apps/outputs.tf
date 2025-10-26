##################################
# shared resource group output
##################################
output "resource_group_location" {
  value = azurerm_resource_group.pepco_foundation_we_rg.location
}
output "resource_group_name" {
  value = azurerm_resource_group.pepco_foundation_we_rg.name
}

##################################
# NetSpoke output
##################################
output "resource_group_netspoke_location" {
  description = "The location of the NetSpoke DIGIWEBMOB resource group"
  value       = azurerm_resource_group.pepco_foun_netspoke_we_rg.location
}
output "resource_group_netspoke_name" {
  description = "The name of the NetSpoke DIGIWEBMOB resource group"
  value       = azurerm_resource_group.pepco_foun_netspoke_we_rg.name
}
output "virtual_network_id" {
  description = "The ID of the DIGIWEBMOB virtual network"
  value       = azurerm_virtual_network.pepco_foun_netspoke_we_vnet.id
}
output "virtual_network_name" {
  description = "The name of the DIGIWEBMOB virtual network"
  value       = azurerm_virtual_network.pepco_foun_netspoke_we_vnet.name
}
output "subnet_pe_id" {
  description = "The ID of the private endpoint subnet (snet-d-we-pe-01)"
  value       = azurerm_subnet.pepco_foun_netspoke_we_subnet_pe.id
}
output "subnet_pe_name" {
  description = "The name of the private endpoint subnet (snet-d-we-pe-01)"
  value       = azurerm_subnet.pepco_foun_netspoke_we_subnet_pe.name
}
output "subnet_apim_id" {
  description = "The ID of the API Management subnet (snet-d-we-apim-01)"
  value       = azurerm_subnet.pepco_foun_netspoke_we_subnet_apim.id
}
output "subnet_apim_name" {
  description = "The name of the API Management subnet (snet-d-we-apim-01)"
  value       = azurerm_subnet.pepco_foun_netspoke_we_subnet_apim.name
}
output "nsg_pe_id" {
  description = "The ID of the private endpoint network security group (nsg-d-we-pe-01)"
  value       = azurerm_network_security_group.pepco_foun_netspoke_we_nsg_pe.id
}
output "nsg_pe_name" {
  description = "The name of the private endpoint network security group (nsg-d-we-pe-01)"
  value       = azurerm_network_security_group.pepco_foun_netspoke_we_nsg_pe.name
}
output "nsg_apim_id" {
  description = "The ID of the API Management network security group (nsg-d-we-apim-01)"
  value       = azurerm_network_security_group.pepco_foun_netspoke_we_nsg_apim.id
}
output "nsg_apim_name" {
  description = "The name of the API Management network security group (nsg-d-we-apim-01)"
  value       = azurerm_network_security_group.pepco_foun_netspoke_we_nsg_apim.name
}
output "route_table_pe_id" {
  description = "The ID of the private endpoint route table (rt-d-we-pe-01)"
  value       = azurerm_route_table.pepco_foun_netspoke_we_rt_pe.id
}
output "route_table_pe_name" {
  description = "The name of the private endpoint route table (rt-d-we-pe-01)"
  value       = azurerm_route_table.pepco_foun_netspoke_we_rt_pe.name
}
output "route_table_apim_id" {
  description = "The ID of the API Management route table (rt-d-we-apim-01)"
  value       = azurerm_route_table.pepco_foun_netspoke_we_rt_apim.id
}
output "route_table_apim_name" {
  description = "The name of the API Management route table (rt-d-we-apim-01)"
  value       = azurerm_route_table.pepco_foun_netspoke_we_rt_apim.name
}
output "infrastructure_subnet_id" {
  value       = azurerm_subnet.pepco_foun_netspoke_we_subnet_containerApp.id
  description = "The ID of the subnet for Container Apps"
}

#####################################
# storage account output
#####################################
output "storage_account_name" {
  value = azurerm_storage_account.pepco_shared_storageaccount.name
}
output "share_storage_account_primary_access_key" {
  value     = azurerm_storage_account.pepco_shared_storageaccount.primary_access_key
  sensitive = true
}
output "storage_fileshare_name" {
  value = azurerm_storage_share.pepco_shared_storageaccount_fileshare.name
}

#####################################
# container registry output
#####################################
output "container_reg_id" {
  value = azurerm_container_registry.pepco_container_registry_we.id
}

output "container_reg_login_server" {
  value = azurerm_container_registry.pepco_container_registry_we.login_server
}

#####################################
# log analytics output
#####################################
output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.pepco_shared_loganalytics.id
}
output "log_analytics_name" {
  value = azurerm_log_analytics_workspace.pepco_shared_loganalytics.name
}

#####################################
# container env output
#####################################
output "container_app_environment_id" {
  description = "The ID of the Container Apps Environment"
  value       = azurerm_container_app_environment.pepco_shared_container_environment.id
}
output "containerapps_environment_name" {
  description = "The name of the Container Apps Environment"
  value       = azurerm_container_app_environment.pepco_shared_container_environment.name
}

output "managed_environment_storage_name" {
  description = "The name of the managed environment storage"
  value       = azurerm_container_app_environment_storage.pepco_shared_container_env_storage.name
}


#####################################
# container app output
#####################################
# output "container_app_fqdn" {
#   description = "The FQDN of the container app"
#   value       = azurerm_container_app.container_app.latest_revision_fqdn
# }
