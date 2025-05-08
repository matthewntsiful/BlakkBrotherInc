# Create a local variable for naming conventions
locals {
  name_prefix = "${var.owner}-${var.environment}-${var.region}"
}

# Local variables for common tags
locals {
  common_tags = {
    Owner       = var.owner
    Environment = var.environment
    Region      = var.region
  }
}

# Local variables for resource names
locals {
  ssm_role_name                = "${local.name_prefix}-geek-ssm-role"
  ssm_profile_name             = "${local.name_prefix}-geek-ssm-profile"
  ecs_task_role_name           = "${local.name_prefix}-geek-ecs-task-role"
  ecs_execution_role_name      = "${local.name_prefix}-geek-ecs-execution-role"
  ecs_task_execution_role_name = "${local.name_prefix}-geek-ecs-task-execution-role"
  ecs_service_role_name        = "${local.name_prefix}-geek-ecs-service-role"
  s3_role_name                 = "${local.name_prefix}-geek-s3-role"
}