#Get S3 Bucket Name
output "s3_bucket_name" {
    value = aws_s3_bucket.s3_logging_bucket.id
}

#Get S3 Bucket ARN
output "s3_bucket_arn" {
    value = aws_s3_bucket.s3_logging_bucket.arn
}