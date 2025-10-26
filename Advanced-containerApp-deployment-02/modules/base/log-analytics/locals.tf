locals {
  all_tags = merge(
    {
      Region         = var.region
      Automation     = "True"
      ServiceAccount = "Terragrunt-Deployer"
      CostCenter     = "West Europe"
    },
    {
      application    = "NONE"
      environment    = "DEV"
      BackupSchedule = "NONE"
      BackupType     = "NONE"
    }
  )
}
