#-----------------------------------------------------------------------------------------
# General Variables
#-----------------------------------------------------------------------------------------
# AWS provider configuration
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

#-----------------------------------------------------------------------------------------
# Storage Module Variables
#-----------------------------------------------------------------------------------------
# Name of the S3 bucket to be created
variable "bucket_name" {
  type = string
}

# Access Control List (ACL) setting for the S3 bucket
variable "bucket_acl" {
  type    = string
  default = "private"
}

#---------------------------------------------------------------------------------------
#Network Module Variables
#---------------------------------------------------------------------------------------- 
#Create varriables for the networking module based on the ./02-Networking/locals.tf file    
 

variable "az_count" {
    description = "Number of AZs to use"
    type        = number
    default     = 2 # Default value for number of AZs
}
variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
}

variable "vpc_name" {
    description = "Name of the VPC"
    type        = string
    default     = "vpc" # Default value for VPC name    
}

variable subnet_bits {  
    description = "Number of bits for the subnet mask"
    type        = number
}

variable "igw_name" {
    description = "Name of the Internet Gateway"
    type        = string
    default     = "igw" # Default value for Internet Gateway name
}
variable "web_subnet_name" {
    description = "Name of the web subnet"
    type        = string
    default     = "web_subnet" # Default value for web subnet name
}
variable "app_subnet_name" {
    description = "Name of the application subnet"
    type        = string
    default     = "app_subnet" # Default value for application subnet name
}
variable "db_subnet_name" {
    description = "Name of the database subnet"
    type        = string
    default     = "db_subnet" # Default value for database subnet name
}
variable "public_rtb_name" {
    description = "Name of the public route table"
    type        = string
    default     = "public_rtb" # Default value for public route table name    
}
variable "private_rtb_name" {
    description = "Name of the private route table"
    type        = string
    default     = "private_rtb" # Default value for private route table name
}
variable "nat_eip_name" {
    description = "Name of the NAT EIP"
    type        = string
    default     = "nat_eip" # Default value for NAT EIP name
}
variable "nat_gateway_name" {
    description = "Name of the NAT Gateway"
    type        = string
    default     = "nat_gateway" # Default value for NAT Gateway name
} 

variable "public_destination_cidr" {
    description = "CIDR block for public destination"
    type        = string
}

variable "private_destination_cidr" {
    description = "CIDR block for private destination"
    type        = string
}

variable "availability_zones" {
  description = "List of Availability Zones to use"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}


   