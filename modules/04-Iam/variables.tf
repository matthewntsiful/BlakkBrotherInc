# Variables for Networking module
# Region
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

# Region Suffix
variable "rgn_suffix" {
  description = "AWS region suffix"
  type        = string
}

# Owner
variable "owner" {
  description = "Owner of the resources"
  type        = string
}

# Environment
variable "environment" {
  description = "Environment name"
  type        = string
}

# Variable for SSM Policy ARN
variable "ssm_policy_arns" {
  description = "Amazon SSM Policy ARN"
  type        = list(string)
}

# Variable ECS Task Managed Policy ARN
variable "ecs_task_policy_arns" {
  description = "Amazon ECS Task Execution Policy ARN"
  type        = list(string)
}

# Variable ECS Execution Managed Policy ARN
variable "ecs_execution_policy_arns" {
  description = "Amazon ECS Execution Policy ARN"
  type        = list(string)
}

# # Variable for ECS Service Policy ARNS
# variable "ecs_service_policy_arns" {
#   description = "Amazon ECS Service Policy ARN"
#   type        = list(string)
# }

# Variable for S3 Policy ARN
variable "s3_policy_arns" {
  description = "Amazon S3 Policy ARN"
  type        = list(string)
}