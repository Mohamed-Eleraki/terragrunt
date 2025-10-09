output "container_app_fqdn" {
  value       = azurerm_container_app.eraki_container_apps_we.latest_revision_fqdn
  description = "The FQDN of the container app"
}
