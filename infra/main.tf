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
# IAM module configuration  
#-----------------------------------------------------------------------------------------
# This module creates an IAM role with the specified configuration. 
# Inputs:
#   - region: AWS region where role will be created
#   - environment: Environment name (dev/staging/prod)
#   - project_name: Name of the project 
#   - owner: Owner/team responsible for the role
#   - role_name: Name of the role
module "iam" {
  source       = "../modules/04-Iam"
  
  region       = var.region
  environment  = var.environment  
  
  owner        = var.owner
   ssm_policy_arns           = var.ssm_policy_arns
  ecs_task_policy_arns      = var.ecs_task_policy_arns
  ecs_execution_policy_arns = var.ecs_execution_policy_arns
  # ecs_service_policy_arns   = var.ecs_service_policy_arns
  s3_policy_arns            = var.s3_policy_arns
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

#-----------------------------------------------------------------------------------------
# Security module configuration
#-----------------------------------------------------------------------------------------
# This module creates security groups with the specified configuration.
# Inputs:
#   - region: AWS region where security groups will be created
#   - environment: Environment name (dev/staging/prod)
#   - project_name: Name of the project 
#   - owner: Owner/team responsible for the security groups
#   - vpc_id: ID of the VPC where security groups will be created 
#   - vpc_name: Name of the VPC where security groups will be created
#   - jump_server_sg_name: Name of the security group for the jump server
#   - alb_sg_name: Name of the security group for the Application Load Balancer (ALB)
#   - ecs_sg_name: Name of the security group for the Amazon Elastic Container Service (ECS)
#   - mysql_sg_name: Name of the security group for the Amazon Relational Database Service (RDS)
module "security" {
  source       = "../modules/03-Security"
  
  region       = var.region
  environment  = var.environment
  project_name = var.project_name
  owner        = var.owner
  vpc_name     = var.vpc_name
  alb_sg_name   = var.alb_sg_name
  ecs_sg_name   = var.ecs_sg_name
  mysql_sg_name = var.mysql_sg_name
  jump-server_sg_name = var.jump-server_sg_name
  public_destination_cidr = var.public_destination_cidr
  ssh_port = var.ssh_port
  http_port = var.http_port
  https_port = var.https_port
  mysql_port = var.mysql_port
  my_ip = var.my_ip
  
  
  depends_on = [ module.networking ]
}