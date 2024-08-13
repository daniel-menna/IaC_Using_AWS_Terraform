# Project - Deploy of one Stack de MLDT with PySpark in Amazon EMR
# Setting remote state, version of terraform

# Terraform version
terraform {
  required_version = "~> 1.7"

  # Provider AWS
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Setting remote state for Terraform
  backend "s3" {
    encrypt = true
    # Create manualy this bucker before running terraform instructions
    bucket  = "dsd-p1-terraform-<id-aws>"
    key     = "dsd-p1.tfstate"
    region  = "us-east-2"
  }
}

# Provider Region
provider "aws" {
  region = "us-east-2"
}