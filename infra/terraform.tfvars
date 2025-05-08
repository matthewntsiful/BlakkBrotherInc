# Project configuration settings
# - project_name: Name of the project
# - owner: Project owner/maintainer
# - bucket_name: Name of the logging bucket

#------------------------------------------------------------------------------------------
# General configuration Variables Values


project_name = "blakkbrotherinc"
owner        = "BlakkBrother"
environment  = "dev" 
region       = "us-east-1"

#-----------------------------------------------------------------------------------------
# Storage module configuration Variables Values
#-----------------------------------------------------------------------------------------
bucket_name  = "blakk-bucket"
bucket_acl   = "private"


#-----------------------------------------------------------------------------------------
# Network module configuration Variables Values
#-----------------------------------------------------------------------------------------
vpc_cidr                = "10.0.0.0/16"
subnet_bits             = 4

# Optional if you want to override the defaults
vpc_name                = "blakk-vpc"
igw_name                = "blakk-igw"
web_subnet_name         = "web-subnet"
app_subnet_name         = "app-subnet"
db_subnet_name          = "db-subnet"
public_rtb_name         = "public-rtb"
private_rtb_name        = "private-rtb"
nat_eip_name            = "nat-eip"
nat_gateway_name        = "nat-gateway"
public_destination_cidr  = "0.0.0.0/0"
private_destination_cidr = "10.0.0.0/16"

#-----------------------------------------------------------------------------------------
# Security module configuration Variables Values
#-----------------------------------------------------------------------------------------
jump-server_sg_name = "jump-server-sg"
alb_sg_name        = "alb-sg"
ecs_sg_name       = "ecs-sg"
mysql_sg_name     = "mysql-sg"
my_ip =  "10.0.0.0/16" 
ssh_port = 22
http_port = 80
https_port = 443
mysql_port = 3306

#------------------------------------------------------------------------------------------
#IAM Module Configuration Varriable Values
#------------------------------------------------------------------------------------------
# SSM Policy ARNS
ssm_policy_arns = [
  "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
  "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
]

# ECS Task Policy ARNS
ecs_task_policy_arns = [
  "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
]

# ECS Execution Policy ARNS
ecs_execution_policy_arns = [
  "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
]

# # ECS Service Policy ARNS
# ecs_service_policy_arns = [
#   "arn:aws:iam::aws:policy/aws-service-role/AmazonECSServiceRolePolicy"
# ]


# S3 Managed Policy ARNs
s3_policy_arns = [
  "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ]

  