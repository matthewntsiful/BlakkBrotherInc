# Local Variables Block - Defines naming convention for resources 
# Format: environment-project_name-region
locals {
    name_prefix = "${var.environment}-${var.project_name}-${var.region}"

}   

# Common Tags Block - Defines standard tags to be applied to all resources
# Tags include: Environment, Managed_By, Owner, Project
locals {
    common_tags = {
        Environment = var.environment
        Managed_By  = "Terraform"  # Static value indicating infrastructure is managed via Terraform
        Owner       = var.owner
        Project    = var.project_name
    }
}

# Resource Names Block - Defines standardized names for specific resources
locals {
    # S3 bucket name format: environment-project_name-region-s3-bucket-bucket_name
    s3_bucket_name = "${local.name_prefix}-s3-bucket-${var.bucket_name}"
}  
