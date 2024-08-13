# Project - Deploy of one Stack de MLDT with PySpark in Amazon EMR
# S3 Variables

variable "name_bucket" {
  type        = string
  description = "Bucket name"
}

variable "versioning_bucket" {
  type        = string
  description = "Defining nif the bucket versioning will be enable"
}

variable "files_bucket" {
  type        = string
  description = "Python scripts source folder"
}

variable "files_data" {
  type        = string
  description = "Data source folder"
}

variable "files_bash" {
  type        = string
  description = "Bash scripts source folder"
}