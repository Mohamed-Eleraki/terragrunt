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
variable "resource_group_name" {
  description = "resource group name"
  type        = string
}
variable "sysrole" {
  description = "container registry system role"
  type        = string
}
# variable "resource_number" {
#   description = "container registry resource number"
#   type        = number
# }
