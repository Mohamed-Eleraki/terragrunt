
variable "region" {
  description = "region in which resources will be created"
  type        = string
}
variable "host_environment_short" {
  description = "an environment name short"
  type        = string
}
variable "region_short" {
  description = "region short name"
  type        = string
}
variable "log_analytics_retention" {
  description = "log analytics retention in days"
  type = number
}
variable "storage_account_name" {
  description = "storage account name"
  type        = string
}
variable "storage_fileshare_name" {
  description = "storage file share name"
  type        = string
}
variable "share_storage_account_primary_access_key" {
  description = "storage account primary access key for file share"
  type        = string  
}
variable "function" {
  description = "function of the environment"
  type        = string
}
variable "resource_number" {
  description = "resource number to differentiate resources"
  type        = string
}
variable "resource_group_name" {
  description = "resource group name where resources will be created"
  type        = string
}
variable "log_analytics_workspace_id" {
  description = "log analytics workspace id"
  type        = string
}
