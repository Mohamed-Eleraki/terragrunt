locals {
  all_tags = merge(
    {
      Region         = var.region
      Automation     = "True"
      ServiceAccount = "Terragrunt-Deployed"
      CostCenter     = "West Europe"
    },
    {
      application    = "COMMON"
      environment    = "DEV"
      BackupSchedule = "NONE"
      BackupType     = "NONE"
    }
  )
}
