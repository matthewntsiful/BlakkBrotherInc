# Create local values for Naming Convention
# ==========================================
# The naming convention is: {owner}-{environment}-{region}
locals {
  name_prefix = "${var.owner}-${var.environment}-${var.region}"
}

# Create local values for common tags
# ===================================
# The common tags are used to tag all resources in the module
locals {
  common_tags = {
    # The owner of the resources
    Owner       = var.owner
    # The environment the resources are in (e.g. dev, prod)
    Environment = var.environment
    # The region the resources are in
    Region      = var.region
  }
}

# Create local values for resource names
# ======================================
# The resource names are created by concatenating the naming
# convention with the resource name
locals {
  jump_server_sg_name = "${local.name_prefix}-${var.jump_server_sg_name}"
  alb_sg_name         = "${local.name_prefix}-${var.alb_sg_name}"
  ecs_sg_name         = "${local.name_prefix}-${var.ecs_sg_name}"
  rds_sg_name         = "${local.name_prefix}-${var.rds_sg_name}"
  waf_acl_name        = "${local.name_prefix}-${var.waf_acl_name}"
  waf_acl_metric_name = "${local.name_prefix}-${var.waf_acl_metric_name}"
}

