#-------------------------------------------------
#Variable for Security Module
#-------------------------------------------------

# The AWS region where the resources will be deployed.
variable "region" {
    description = "AWS region to deploy resources"
    type        = string
    default     = "us-east-1"
}

# The region suffix that will be used to create the resources.
variable "rgn_suffix" {
    description = "AWS region suffix"
    type        = string
    default     = "east"
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

# The ID of the VPC where the resources will be created.
variable "vpc_id" {
    description = "VPC ID"
    type        = string
    default     = ""
}

# The CIDR block of the VPC
variable "vpc_cidr" {
    description = "VPC CIDR block"
    type        = string
    default     = "10.0.0.0/16"
}

# The name of the Jump Server Security Group.
variable "jump_server_sg_name" {
    description = "Jump Server Security Group Name"
    type        = string
    default     = "jump-server-sg"
}

# The name of the ALB Security Group.
variable "alb_sg_name" {
    description = "ALB Security Group Name"
    type        = string
    default     = "alb-sg"
}

# The name of the ECS Security Group.
variable "ecs_sg_name" {
    description = "ECS Security Group Name"
    type        = string
    default     = "ecs-sg"
}

# The name of the RDS Security Group.
variable "rds_sg_name" {
    description = "RDS Security Group Name"
    type        = string
    default     = "rds-sg"
}

# The name of the WAF ACL.
variable "waf_acl_name" {
    description = "WAF ACL Name"
    type        = string
    default     = "waf-acl"
}

# The name of the WAF ACL metric.
variable "waf_acl_metric_name" {
    description = "WAF ACL Metric Name"
    type        = string
    default     = "waf-acl-metric"
}

# The HTTP port.
variable "http_port" {
    description = "HTTP Port"
    type        = number
    default     = 80
}

# The HTTPS port.
variable "https_port" {
    description = "HTTPS Port"
    type        = number
    default     = 443
}

# The SSH port.
variable "ssh_port" {
    description = "SSH Port"
    type        = number
    default     = 22
}

# The MySQL port.
variable "mysql_port" {
    description = "MySQL Port"
    type        = number
    default     = 3306
}

