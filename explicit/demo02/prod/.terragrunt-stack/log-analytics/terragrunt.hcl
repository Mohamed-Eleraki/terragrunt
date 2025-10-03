include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "."
}

inputs = {
  host_environment_short = var.host_environment_short
  region_short           = var.region_short
  sysrole                = var.sysrole
  resource_number        = var.resource_number
  region                 = var.region
  resource_group_name    = var.resource_group_name
  retention_in_days      = var.retention_in_days
}
