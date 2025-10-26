
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
variable "function" {
  description = "function name for the resource group"
  type        = string
}
variable "resource_number" {
  description = "resource number to differentiate resource groups"
  type        = number
}
