locals {
  all_tags = merge(
    {
      Region         = var.region
      Automation     = "True"
      ServiceAccount = "Terrafrom-pipeline"
      CostCenter     = "West Europe"
    },
    {
      Application    = "NONE"
      BackupSchedule = "NONE"
      BackupType     = "NONE"
    }
  )
}
