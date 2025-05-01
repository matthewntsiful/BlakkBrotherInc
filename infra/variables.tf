# AWS region where resources will be created
variable "region" {
  type        = string
  default     = "us-east-1"
}

# Environment name (e.g. dev, staging, prod)
variable "environment" {
  type        = string
  default     = "dev"
}

# Name of the project/application
variable "project_name" {
  type = string
}

# Owner/team responsible for the resources
variable "owner" {
  type = string
}

# Name of the S3 bucket to be created
variable "bucket_name" {
  type = string
}

# Access Control List (ACL) setting for the S3 bucket
variable "bucket_acl" {
  type    = string
  default = "private"
}
