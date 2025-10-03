terraform {
  source = "../../../modules/modules/Foundation/resource-group"
}

include {
  path = find_in_parent_folders("terragrunt.hcl")
}

inputs = {
  host_environment_short = "d"
  region_short           = "we"
  sysrole                = "containerapps"
  region                 = "West Europe"
}
