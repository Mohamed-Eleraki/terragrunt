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
variable "log_analytics_id" {
  description = "log analytics workspace id"
  type        = string
}
variable "sysrole" {
  description = "container environment system role"
  type        = string
}
variable "resource_number" {
  description = "container environment resource number"
  type        = number
}
variable "workload_profile_name" {
  description = "container environment workload profile name"
  type = string
}
variable "workload_profile_type" {
  description = "contaienr environment workload profile type"
}
variable "workload_profile_min_count" {
  description = "container environment workload profile minimum instance count"
  type = number
}
variable "workload_profile_max_count" {
  description = "container environment workload profile maximum instance count"
  type = number
}

variable "storage_account_name" {
  description = "storage account name for managed environment storage"
  type = string
}

variable "file_share_name" {
  description = "file share name for managed environment storage"
  type = string
}

variable "storage_account_access_key" {
  description = "storage account access key for managed environment storage"
  type = string
  sensitive = true
}

variable "infrastructure_subnet_id" {
  description = "subnet id for the container app environment infrastructure"
  type = string
  default = null
}
