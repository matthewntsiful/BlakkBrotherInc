# -------------------------------------------------------------------------------------   
# General Variables
# -------------------------------------------------------------------------------------

# The AWS region where the resources will be deployed.
# This variable controls the region where all resources will be created.
# The default value is us-east-1.
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}
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
#--------------------------------------------------------------------------------------
# Variables for Storage Module
# -------------------------------------------------------------------------------------

# The name of the S3 bucket.
# This variable controls the name of the S3 bucket that will be created.
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

#--------------------------------------------------------------------------------------
# Variables for Networking Module
# -------------------------------------------------------------------------------------

# The name of the VPC.
# This variable controls the name of the VPC that will be created.
# The default value is vpc.
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "vpc"
}

# The number of Availability Zones to use.
# This variable controls the number of Availability Zones that will be used to
# create the subnets.

variable "az_count" {
  description = "Number of AZs to use"
  type        = number
  
}

# The CIDR block for the VPC.
# This variable controls the CIDR block that will be used to create the VPC.
# The default value is 10.0.0.0/16.
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Internet Gateway Name
# This variable controls the name of the Internet Gateway that will be created.
# The default value is igw.
variable "igw_name" {
  description = "Name of the Internet Gateway"
  type        = string
  default     = "igw"
}

# Web Subnet Name
# This variable controls the name of the Web Subnet that will be created.
# The default value is web.
variable "web_subnet_name" {
  description = "Name of the Web Subnet"
  type        = string
  default     = "web"
}

#App Subnet Name
# This variable controls the name of the App Subnet that will be created.
# The default value is app.
variable "app_subnet_name" {
  description = "Name of the App Subnet"
  type        = string
  default     = "app"
}

#DB Subnet Name
# This variable controls the name of the DB Subnet that will be created.
# The default value is db.
variable "db_subnet_name" {
  description = "Name of the DB Subnet"
  type        = string
  default     = "db"
}

#NAT  Gateway Name
# This variable controls the name of the NAT Gateway that will be created.
# The default value is nat.
variable "ngw_name" {
  description = "Name of the NAT Gateway"
  type        = string
  default     = "nat"
}

#Elastic IP Name
# This variable controls the name of the Elastic IP that will be created.
# The default value is eip.
variable "nat_eip_name" {
  description = "Name of the Elastic IP"
  type        = string
  default     = "eip"
}

#Public Route Table Name
# This variable controls the name of the Public Route Table that will be created.
# The default value is public-route-table.
variable "public_route_table_name" {
  description = "Name of the Public Route Table"
  type        = string
  default     = "public-route-table"
}

#App Route Table Name
# This variable controls the name of the App Route Table that will be created.
# The default value is app-route-table.
variable "app_route_table_name" {
  description = "Name of the App Route Table"
  type        = string
  default     = "app-route-table"
}

#DB Route Table Name
# This variable controls the name of the DB Route Table that will be created.
# The default value is db-route-table.
variable "db_route_table_name" {
  description = "Name of the DB Route Table"
  type        = string
  default     = "db-route-table"
}

#-------------------------------------------------------------------------------------------
# Variables for Storage Module
#-------------------------------------------------------------------------------------------



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

# -------------------------------------------------------------------------------------------
# Variables for IAM Module
# -------------------------------------------------------------------------------------------
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

#-------------------------------------------------------------------------------------------
# Variables for Compute Module
#-------------------------------------------------------------------------------------------

# Jump Server Instance Type
variable "jump_server_instance_type" {
  description = "EC2 instance type for the jump server"
  type        = string
  default     = "t3.micro"
}

# Variable for Container Port
variable "container_port" {
  description = "Port on which the container is listening"
  type        = number
}

# Variable ALB HTTPS Listener Port
variable "alb_https_listener_port" {
  description = "HTTPS port for ALB listener"
  type        = number
}

# Variable for wildcard Domain Name
variable "wildcard_domain_name" {
  description = "Wildcard domain name for ALB"
  type        = string
}