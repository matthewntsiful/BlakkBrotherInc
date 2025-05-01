# Storage module configuration
# Creates an S3 bucket with specified settings
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
