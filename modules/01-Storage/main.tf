 #Create S3 bucket for logging - this is the main bucket resource
resource "aws_s3_bucket" "s3_logging_bucket" {
  bucket = "${local.name_prefix}-s3-logging-bucket"
  # Deprecated: Use aws_s3_bucket_acl resource instead
  # acl    = "private"
  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-s3-logging-bucket"
      Purpose = "S3 Bucket for logging for the module"
    }
  )
}

# Block all public access to the bucket for security
# This ensures the bucket and its contents remain private
resource "aws_s3_bucket_public_access_block" "s3_logging_bucket_public_access_block" {
  bucket = aws_s3_bucket.s3_logging_bucket.id

  block_public_acls       = true  # Blocks public ACLs
  block_public_policy     = true  # Blocks public bucket policies
  ignore_public_acls      = true  # Ignores any public ACLs
  restrict_public_buckets = true  # Restricts public bucket policies
}

# Enable versioning on the bucket to maintain object history
# This helps protect against accidental deletions and modifications
resource "aws_s3_bucket_versioning" "s3_logging_bucket_versioning" {
  bucket = aws_s3_bucket.s3_logging_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Configure bucket logging - logs will be stored in the same bucket
# Uses the bucket as both source and target for logging
resource "aws_s3_bucket_logging" "s3_logging_bucket_logging" {
  bucket = aws_s3_bucket.s3_logging_bucket.id
  target_bucket = aws_s3_bucket.s3_logging_bucket.id
  target_prefix = "${local.name_prefix}-s3-logging-bucket/"
}

# Set lifecycle rules to manage object retention
# Automatically expires objects after 365 days to manage storage costs
resource "aws_s3_bucket_lifecycle_configuration" "s3_logging_bucket_lifecycle" {
  bucket = aws_s3_bucket.s3_logging_bucket.id

  rule {
    id     = "log-expiration"
    status = "Enabled"

    filter {
      prefix = "" # Applies to all objects
    }

    expiration {
      days = 90
    }
  }
}



# Enable server-side encryption for data at rest
# Uses AES256 encryption algorithm for all objects in the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_logging_bucket_encryption" {
  bucket = aws_s3_bucket.s3_logging_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
} 
