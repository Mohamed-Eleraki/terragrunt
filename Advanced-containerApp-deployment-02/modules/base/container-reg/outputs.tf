

output "container_reg_id" {
  value = azurerm_container_registry.eraki_common_creg_we.id
}

output "container_reg_login_server" {
  value = azurerm_container_registry.eraki_common_creg_we.login_server
}
