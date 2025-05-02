#Set Local Variables Block for Securuity Module
# This block defines local variables that are used throughout the module. 
locals {
    name_prefix = "${var.environment}-${var.project_name}-${var.region}"
      
}
locals {
    common_tags = {
        Environment = var.environment
        Managed_By  = "Terraform"  # Static value indicating infrastructure is managed via Terraform
        Owner       = var.owner
        Project     = var.project_name
    }
}

locals {
   jump-server_sg = "${local.name_prefix}-${var.jump-server_sg}"
   alb_sg = "${local.name_prefix}-${var.alb_sg}"
   ecs_sg = "${local.name_prefix}-${var.ecs_sg}"
   rds_sg = "${local.name_prefix}-${var.rds_sg}"
   vpc_name = "${local.name_prefix}-${var.vpc_name}"
}