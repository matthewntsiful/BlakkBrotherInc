# -----------------------------
# Variables for Storage Module
# -----------------------------

# The AWS region where the resources will be deployed.
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# The owner of the resources.
variable "owner" {
  description = "Owner of the resources"
  type        = string
  default     = "AWS"
}

# The environment of the resources.
variable "environment" {
  description = "Environment of the resources"
  type        = string
  default     = "dev"
}

# The name of the S3 bucket.
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

