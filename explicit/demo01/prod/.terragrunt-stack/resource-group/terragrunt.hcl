terraform {
  source = "."
}

include {
  path = "../../root.hcl"
}

inputs = {
  host_environment_short = "d"
  region_short           = "we"
  sysrole                = "containerapps"
  region                 = "westeurope"
}
