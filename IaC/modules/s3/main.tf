# Project - Deploy of one Stack de MLDT with PySpark in Amazon EMR
# S3 storage model

# Bucket creation
resource "aws_s3_bucket" "create_bucket" {

  bucket = var.name_bucket
  
  force_destroy = true

  tags = {
    Name        = "Bucket para uso em conjunto com AWS EMR"
    Environment = "Scripts"
  }

}

# Versioning bucket
resource "aws_s3_bucket_versioning" "versioning_bucket" {
  
  bucket = aws_s3_bucket.create_bucket.id
  
  versioning_configuration {status = var.versioning_bucket}
  
  depends_on = [aws_s3_bucket.create_bucket]
}

# Blocking public access
resource "aws_s3_bucket_public_access_block" "example" {
  
  bucket = aws_s3_bucket.create_bucket.id

  block_public_policy     = false
  
  restrict_public_buckets = false
}

# S3 module
module "s3_object" {
  source       = "./s3_objects"
  files_bucket = var.files_bucket
  files_data   = var.files_data
  files_bash   = var.files_bash
  name_bucket  = aws_s3_bucket.create_bucket.bucket
}


