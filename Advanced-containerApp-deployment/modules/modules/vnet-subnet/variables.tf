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
  description = "resource sys role"
  type        = string
}

variable "resource_number" {
  description = "vnet resource number"
  type        = string
}

variable "address_space" {
  description = "address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefixes" {
  description = "address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}
