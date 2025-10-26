#####################################
# storage account output
#####################################
output "storage_account_name" {
  value = azurerm_storage_account.eraki_common_we_storageaccount.name
}
output "share_storage_account_primary_access_key" {
  value     = azurerm_storage_account.eraki_common_we_storageaccount.primary_access_key
  sensitive = true
}
output "storage_fileshare_name" {
  value = azurerm_storage_share.eraki_common_we__storageaccount_fileshare.name
}