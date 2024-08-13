# Project - Deploy of one Stack de MLDT with PySpark in Amazon EMR
# Variable definition script

variable "name_bucket" {
  type        = string
  description = "Bucket Name"
}

variable "versioning_bucket" {
  type        = string
  description = "Defining if the bucket versioning will be enable"
}

variable "files_bucket" {
  type        = string
  description = "Source folder for Python Scripts"
  default     = "./pipeline"
}

variable "files_data" {
  type        = string
  description = "Data source folder"
  default     = "./dados"
}

variable "files_bash" {
  type        = string
  description = "Bash scripts folder"
  default     = "./scripts"
}

variable "name_emr" {
  type        = string
  description = "EMR CLuster name"
}
