# Project configuration settings
# - project_name: Name of the project
# - owner: Project owner/maintainer
# - bucket_name: Name of the logging bucket

project_name = "blakkbrotherinc"
owner        = "Matthew Odoom Ntsiful"
environment  = "dev" 
region       = "us-east-1"

#-----------------------------------------------------------------------------------------
# Storage module configuration
bucket_name  = "blakk-bucket"
bucket_acl   = "private"


#-----------------------------------------------------------------------------------------
# Network module configuration
az_count                = 2
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
