# ------------------------------------------------------------
# Variables for Networking Module
# ------------------------------------------------------------
#
# The variables in this file are used to configure the AWS
# resources created in the Networking module.
#

# The AWS region where the resources will be deployed.
# This variable controls the region where all resources will be created.
# The default value is us-east-1.
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
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

# The name of the VPC.
# This variable controls the name of the VPC that will be created.
# The default value is vpc.
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "vpc"
}

#Region Suffix
# This variable controls the region suffix that will be used to create the VPC.
# The default value is east.
variable "rgn_suffix" {
  description = "AWS region suffix"
  type        = string
  default     = "east"
}

# The number of Availability Zones to use.
# This variable controls the number of Availability Zones that will be used to
# create the subnets.
# The default value is 2.
variable "az_count" {
  description = "Number of AZs to use"
  type        = number
  default     = 2
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


