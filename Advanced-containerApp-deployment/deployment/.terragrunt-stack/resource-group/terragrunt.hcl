
terraform {
  source = "../../../modules/modules/resource-group"
}

include {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  host_environment_short = values.host_environment_short
  region_short           = values.region_short
  sysrole                = values.sysrole
  region                 = values.region
}
