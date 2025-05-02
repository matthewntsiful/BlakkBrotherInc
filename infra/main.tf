#-----------------------------------------------------------------------------------------
# Storage module configuration
#-----------------------------------------------------------------------------------------
# This module creates an S3 bucket with the specified configuration. 
# Inputs:
#   - region: AWS region where bucket will be created
#   - environment: Environment name (dev/staging/prod)
#   - project_name: Name of the project
#   - owner: Owner/team responsible for the bucket
#   - bucket_name: Name of the S3 bucket
#   - bucket_acl: Access Control List for the bucket
module "storage" {
  source       = "../modules/01-Storage"
  
  region       = var.region
  environment  = var.environment
  project_name = var.project_name
  owner        = var.owner
  bucket_name  = var.bucket_name
  bucket_acl   = var.bucket_acl
}

#-----------------------------------------------------------------------------------------
# Network module configuration
#-----------------------------------------------------------------------------------------
# This module creates a VPC with the specified configuration. 
# Inputs:
#   - region: AWS region where VPC will be created
#   - environment: Environment name (dev/staging/prod)
#   - project_name: Name of the project
#   - owner: Owner/team responsible for the VPC
#   - vpc_name: Name of the VPC
#   - vpc_cidr: CIDR block for the VPC
#   - az_count: Number of AZs to use
module "networking" {
  source       = "../modules/02-Networking"
  
  region       = var.region
  environment  = var.environment
  project_name = var.project_name
  owner        = var.owner
 az_count     = var.az_count
  vpc_name     = var.vpc_name
  vpc_cidr     = var.vpc_cidr
  igw_name     = var.igw_name
  web_subnet_name        = var.web_subnet_name
  app_subnet_name        = var.app_subnet_name
  db_subnet_name         = var.db_subnet_name
  public_rtb_name        = var.public_rtb_name
  private_rtb_name       = var.private_rtb_name
  nat_eip_name           = var.nat_eip_name
  nat_gateway_name       = var.nat_gateway_name 
  public_destination_cidr = var.public_destination_cidr
  private_destination_cidr = var.private_destination_cidr
  subnet_bits = var.subnet_bits 

  depends_on = [ module.storage] 
}