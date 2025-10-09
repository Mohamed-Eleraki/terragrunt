variable "region" {
  description = "region in which resources will be created"
  type        = string
}
variable "sysrole" {
  description = "container app system role"
  type        = string
}
variable "resource_number" {
  description = "container app container apps"
  type        = number
}
variable "host_environment_short" {
  description = "an environment name short"
  type        = string
}
variable "region_short" {
  description = "region short name"
  type        = string
}
variable "capps_application_name" {
  description = "application app name"
  type        = string
}
variable "resource_group_name" {
  description = "resource group name"
  type        = string
}
variable "container_app_environment_id" {
  description = "container app environment id"
}
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
variable "workload_profile_name" {
  description = "container environment profile name"
  type = string
}
variable "http_scale_rule_min_replicas" {
  description = "minimum number of replicas"
  type        = number
}
variable "http_scale_rule_max_replicas" {
  description = "maximum number of replicas"
  type        = number
}
variable "http_concurrent_requests" {
  description = "number of concurrent requests for HTTP scaling"
  type        = number
}
variable "container_scale_rule_name" {
  description = "name of the container scale rule"
  type        = string
}
variable "containerapp_volume_name" {
  description = "container app volume name"
  type = string
  default = ""
}
variable "containerapp_storage_name" {
 description = "container app volume name"
 type = string
 default = ""
}
variable "allowed_ips" {
  description = "List of allowed IP ranges for ingress traffic"
  type        = list(string)
  # default     = ["203.0.113.1/32", "198.51.100.1/32"]
}
# variable "containerapps" {
#   type = map(object({
#     name = string
#     template = list(object({
#       name   = string
#       image  = string
#       cpu    = number
#       memory = string
#       env = optional(list(object({
#         name  = string
#         value = string
#       })))
#     }))
#     ingress = object({
#       external_enabled = bool
#       target_port      = number
#       transport        = string
#       traffic_weight = list(object({
#         latest_revision = bool
#         percentage      = number
#       }))
#     })
#   }))
# }
