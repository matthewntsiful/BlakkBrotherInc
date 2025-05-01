variable "region" {
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  default     = "dev"
}

variable "project_name" {
  type = string
}

variable "owner" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "bucket_acl" {
  type    = string
  default = "private"
}
