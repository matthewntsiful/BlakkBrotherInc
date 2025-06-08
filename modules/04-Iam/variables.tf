# ------------------------------------------------------
# Variables for IAM Module
# ------------------------------------------------------

# The AWS region where the resources will be deployed.
# This variable controls the region where all resources will be created.
# The default value is us-east-1.
variable "region" {
    description = "AWS region to deploy resources"
    type        = string
    default     = "us-east-1"
}

# The AWS region suffix.
# This variable controls the region suffix used in naming conventions.
# The default value is east.
variable "rgn_suffix" {
    description = "AWS region suffix"
    type        = string
    default     = "east"
}

# The owner of the resources.
# This variable controls the owner tag that will be applied to all resources.
# The default value is AWS.
variable "owner" {
    description = "Owner of the resources"
    type        = string
    default     = "AWS"
}

# The environment of the resources.
# This variable controls the environment tag that will be applied to all resources.
# The default value is dev.
variable "environment" {
    description = "Environment of the resources"
    type        = string
    default     = "dev"
}

# Amazon SSM Role Policy ARNs
# This variable stores a list of ARNs for policies to be attached to the SSM role.
variable "ssm_policy_arns" {
    description = "SSM role policy ARNs"
    type        = list(string)
    default     = []
}

# Amazon ECS Task Managed Policy ARNs
# This variable stores a list of ARNs for managed policies to be attached to the ECS task role.
variable "ecs_task_policy_arns" {
    description = "ECS task managed policy ARNs"
    type        = list(string)
    default     = []
}   

# Amazon ECS Execution Managed Policy ARNs
# This variable stores a list of ARNs for managed policies to be attached to the ECS execution role.
variable "ecs_execution_policy_arns" {
    description = "ECS execution managed policy ARNs"
    type        = list(string)
    default     = []
}

# Amazon S3 Logging Managed Policy ARNs
# This variable stores a list of ARNs for managed policies to be attached to the S3 logging role.
variable "s3_policy_arns" {
    description = "S3 logging managed policy ARNs"
    type        = list(string)
    default     = []
}

# #Variable ECS Service Managed Policy ARNs
# variable "ecs_service_policy_arns" {
#     description = "ECS service managed policy ARNs"
#     type        = list(string)
#     default     = []
# }