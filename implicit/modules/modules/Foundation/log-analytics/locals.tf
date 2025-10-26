locals {
  all_tags = merge(
    {
      Region         = var.region
      Automation     = "True"
      ServiceAccount = "Terragrunt-Deployer"
      CostCenter     = "West Europe"
    },
    {
      Application    = "NONE"
      BackupSchedule = "NONE"
      BackupType     = "NONE"
    }
  )
}
