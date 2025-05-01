module "storage" {
  source       = "../modules/01-Storage"
  
  region       = var.region
  environment  = var.environment
  project_name = var.project_name
  owner        = var.owner
  bucket_name  = var.bucket_name
  bucket_acl   = var.bucket_acl
}
