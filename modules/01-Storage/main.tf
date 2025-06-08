# Resource to create the logging bucket
#========================================
resource "aws_s3_bucket" "log_bucket" {
  # Name of the S3 bucket
  bucket = local.s3_bucket_name

  # Tags for the S3 bucket
  tags = merge(local.common_tags, {
    Name = local.s3_bucket_name
  })
}

# Enable versioning on the logging bucket
resource "aws_s3_bucket_versioning" "Logging_bucket_versioning" {
  # The S3 bucket to enable versioning on
  bucket = aws_s3_bucket.log_bucket.id

  # Enable versioning on the bucket
  versioning_configuration {
    status = "Enabled"
  }
}

# Block public access to the logging bucket
resource "aws_s3_bucket_public_access_block" "Logging_bucket_block_public_access" {
  # The S3 bucket to block public access to
  bucket = aws_s3_bucket.log_bucket.id

  # Block public access to the bucket
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true

}

# Enable access logging on the logging bucket
resource "aws_s3_bucket_logging" "bucket_logging" {
  # The S3 bucket to enable logging on
  bucket = aws_s3_bucket.log_bucket.id

  # The target bucket and prefix for the logs
  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/"

}

# Enable server-side encryption on the logging bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  # The S3 bucket to enable encryption on
  bucket = aws_s3_bucket.log_bucket.id

  # The encryption rule for the bucket
  rule {
    apply_server_side_encryption_by_default {
      
      # The encryption algorithm to use
      sse_algorithm = "AES256"
    }
  }
}

