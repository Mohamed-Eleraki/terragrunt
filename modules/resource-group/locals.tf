locals {
  all_tags = merge(
    {
      Region         = var.region
      Automation     = "True"
      ServiceAccount = "Terraform-pipeline"
      CostCenter     = "West Europe"
    },
    {
      Application    = "NONE"
      BackupSchedule = "NONE"
      BackupType     = "NONE"
    }
  )
}
