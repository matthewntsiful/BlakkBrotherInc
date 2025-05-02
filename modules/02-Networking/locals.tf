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
        Project     = var.project_name
    }
}

# Resource Names Block - Defines standardized names for specific resources
locals {
    # VPC name format: environment-project_name-region-vpc
    vpc_name               = "${local.name_prefix}-${var.vpc_name}"
    igw_name               = "${local.name_prefix}-${var.igw_name}"
    web_subnet_name        = "${local.name_prefix}-${var.web_subnet_name}"
    app_subnet_name        = "${local.name_prefix}-${var.app_subnet_name}"
    db_subnet_name         = "${local.name_prefix}-${var.db_subnet_name}"
    public_rtb_name        = "${local.name_prefix}-${var.public_rtb_name}"
    private_rtb_name       = "${local.name_prefix}-${var.private_rtb_name}"
    nat_eip_name           = "${local.name_prefix}-${var.nat_eip_name}"
    nat_gateway_name       = "${local.name_prefix}-${var.nat_gateway_name}"
    

}