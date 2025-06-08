# Create local variables for naming conventions
# =============================================
# The naming convention is: {owner}-{environment}-{region}
locals {
    name_prefix = "${var.owner}-${var.environment}-${var.region}"
}

# Create local variables for common tags
# ======================================
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

# Create local variables for resource names
# ==========================================
# The resource names are created by concatenating the naming
# convention with the resource name
locals {
    # SSM Role
    ssm_role_name = "${local.name_prefix}-blakk-ssm-role"
    # SSM Profile
    ssm_profile_name = "${local.name_prefix}-blakk-ssm-profile"
    # ECS Task Role
    ecs_task_role_name = "${local.name_prefix}-blakk-ecs-task-role"
    # ECS Execution Role
    ecs_execution_role_name = "${local.name_prefix}-blakk-ecs-execution-role"
    # ECS Task Execution Role
    ecs_task_execution_role_name = "${local.name_prefix}-blakk-ecs-task-execution-role"
    # ECS Service Role
    ecs_service_role_name = "${local.name_prefix}-blakk-ecs-service-role"
    # S3 Logging Role
    s3_logging_role_name = "${local.name_prefix}-blakk-s3-logging-role"
}

