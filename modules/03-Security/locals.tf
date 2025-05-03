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
   jump-server_sg_name =   "${local.name_prefix}-${var.jump-server_sg_name}"
   alb_sg_name =   "${local.name_prefix}-${var.alb_sg_name}"
   ecs_sg_name =   "${local.name_prefix}-${var.ecs_sg_name}"
   mysql_sg_name =  "${local.name_prefix}-${var.mysql_sg_name}"
   vpc_name =  "${local.name_prefix}-${var.vpc_name}"
}