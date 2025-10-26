

#####################################
# container app output
#####################################
output "container_app_fqdn" {
  description = "The FQDN of the container app"
  value       = azurerm_container_app.eraki_container_app.latest_revision_fqdn
}
