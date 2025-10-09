output "container_app_environment_id" {
  description = "The ID of the Container Apps Environment"
  value       = azurerm_container_app_environment.eraki_capp_environment_we.id
}
output "containerapps_environment_name" {
  description = "The name of the Container Apps Environment"
  value       = azurerm_container_app_environment.eraki_capp_environment_we.name
}

output "managed_environment_storage_name" {
  description = "The name of the managed environment storage"
  value       = azurerm_container_app_environment_storage.eraki_capp_env_storage.name
}
