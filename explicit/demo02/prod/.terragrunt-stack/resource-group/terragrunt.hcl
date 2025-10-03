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
  region                 = var.region
}
