# Root Terragrunt configuration for dev environment

remote_state {
  backend = "azurerm"
  config = {
    subscription_id      = "REPLACE_WITH_YOUR_SUBSCRIPTION_ID"
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
  subscription_id = "REPLACE_WITH_YOUR_SUBSCRIPTION_ID"
}
terraform {
  backend "azurerm" {}
}
EOF
}
