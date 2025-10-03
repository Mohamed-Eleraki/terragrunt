terraform {
  source = "."
}

include {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  host_environment_short = "d"
  region_short           = "we"
  sysrole                = "containerapps"
  region                 = "westeurope"
}
