# Common variables
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
variable "sysrole" {
  description = "resource group system role"
  type        = string
}

# Log analytics variables
variable "resource_number" {
  description = "log analytics resource number"
  type        = string
}
variable "retention_in_days" {
  description = "log analytics retention in days"
  type        = number
}

# Container apps variables
variable "container-name" {
  description = "container name"
  type        = string
}
variable "container-image" {
  description = "container images"
}
variable "container-cpu" {
  description = "container cpu"
}
variable "container-memory" {
  description = "container memory"
}
variable "container-env-vars" {
  type = map(list(object({
    name  = string
    value = string
  })))
  description = "Map of environment variables per container (by container key)"
  default     = {}
}
variable "container-external-enable" {
  description = "container-external-enable"
  type        = bool
}
variable "container-target-port" {
  description = "container target port"
  type        = number
}
variable "container-transport" {
  description = "container transport"
  type        = string
}
variable "container-latest-revision" {
  description = "container traffic weight latest revision"
  type        = bool
}
variable "container-precentage" {
  description = "container traffic weight precentage"
  type        = number
}
