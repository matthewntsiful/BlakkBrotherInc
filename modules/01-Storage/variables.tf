# Variables definition file for the AWS infrastructure module

# AWS Region configuration
variable "region" {
  description = "AWS region on which to deploy the solution"
  type        = string
  default     = "us-east-1"
}

# Environment configuration
variable "environment" {
  description = "Environment for the resources (e.g., dev, test, prod)"
  type        = string
  default     = "dev"
}

# Project metadata
variable "project_name" {
  description = "Project name for the resources"
  type        = string       
}
variable "owner" {
  description = "Owner of the resources"
  type        = string
}
variable "bucket_name" {

# S3 bucket configuration
  description = "Name of the S3 bucket"
  type        = string
}
variable "bucket_acl" {
  description = "Access control list for the S3 bucket"
  type        = string
  default     = "private"
}

