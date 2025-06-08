# Output the name of the S3 Bucket
# -----------------------------
# This output returns the name of the S3 Bucket created by this module.
output "s3_bucket_name" {
  description = "The name of the S3 Bucket created by this module."
  value       = aws_s3_bucket.log_bucket.id
}

# Output the ARN of the S3 Bucket
# -----------------------------
# This output returns the ARN of the S3 Bucket created by this module.
output "s3_bucket_arn" {
  description = "The ARN of the S3 Bucket created by this module."
  value       = aws_s3_bucket.log_bucket.arn
}
