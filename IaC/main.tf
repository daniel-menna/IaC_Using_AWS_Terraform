# Project - Deploy of one Stack de MLDT with PySpark in Amazon EMR
# Main Script

# Storage Module
module "s3" {
  source            = "./modules/s3"
  name_bucket       = var.name_bucket
  versioning_bucket = var.versioning_bucket
  files_bucket      = var.files_bucket
  files_data        = var.files_data
  files_bash        = var.files_bash
}

# Security Module
module "iam" {
  source = "./modules/iam"
}

# Processing Module
module "emr" {
  source           = "./modules/emr"
  name_emr         = var.name_emr
  name_bucket      = var.name_bucket
  instance_profile = module.iam.instance_profile
  service_role     = module.iam.service_role
}

