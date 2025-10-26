
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
variable "resource_group_name" {
  description = "name of the resource group"
  type        = string
}
variable "function" {
  description = "function of the environment e.g. shared, app, db"
  type        = string
}
variable "resource_number" {
  description = "resource number to distinguish resources"
  type        = number
}

