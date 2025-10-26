#################################
# general variables
#################################
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
  description = "the function of the resource e.g. webingestion, api, etc."
  type        = string
}
variable "resource_number" {
  description = "a number to uniquely identify the resource"
  type        = string
}
variable "resource_group_name" {
  description = "the name of the resource group"
  type        = string
}
# variable "resource_group_location" {
#   description = "the location of the resource group"
#   type        = string
# }
variable "container_app_environment_id" {
  description = "the id of the container app environment"
  type        = string  
}
variable "managed_environment_storage_name" {
  description = "the name of the managed environment storage"
  type        = string  
}
variable "container_reg_login_server" {
  description = "the login server of the container registry"
  type        = string  
}
variable "container_reg_id" {
  description = "the id of the container registry"
  type        = string  
}
variable "container_name" {
  description = "the name of the container"
  type        = string  
}
variable "image_uri" {
  description = "the full uri of the container image"
  type        = string  
}
variable "target_port" {
  description = "the target port for ingress"
  type        = number  
}