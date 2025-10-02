# Root Terragrunt configuration for dev environment

remote_state {
  backend = "azurerm"
  config = {
    subscription_id      = "856880af-e2ac-41b2-b5fb-e7ebfe4d97bc"
    resource_group_name  = "eraki_terragruntdemo_rg_1001"
    storage_account_name = "erakitfstateaccount17107"
    container_name       = "terragruntstatecontainer"
    key                  = "${path_relative_to_include()}/prod-terragrunt.tfstate"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "azurerm" {
  features {}
  subscription_id = "856880af-e2ac-41b2-b5fb-e7ebfe4d97bc"
}
terraform {
  backend "azurerm" {}
}
EOF
}
