# Project - Deploy of one Stack de MLDT with PySpark in Amazon EMR
# S3 Variables

variable "name_bucket" {
  type        = string
  description = "Bucket Name"
}

variable "files_bucket" {
  type        = string
  description = "Source folders for scripts python to be used during processing"
}

variable "files_data" {
  type        = string
  description = "Source folder for data"
}

variable "files_bash" {
  type        = string
  description = "Source folders for bash scripts to be used during processing"
}