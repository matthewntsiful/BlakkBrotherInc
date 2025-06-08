# Save JumpServer Security Group ID in SSM Parameter Store
resource "aws_ssm_parameter" "jump_server_sg_id" {
    # The name of the parameter in the SSM Parameter Store
    name        = "/${var.environment}/${var.rgn_suffix}/jump-server-sg-id"
    # A description of the parameter
    description = "The ID of the JumpServer Security Group"
    # The type of the parameter
    type        = "SecureString"
    # The value of the parameter, which is the ID of the JumpServer Security Group
    value       = aws_security_group.jump_server_sg.id
}

# Save ALB Security Group ID in SSM Parameter Store
resource "aws_ssm_parameter" "alb_sg_id" {
    # The name of the parameter in the SSM Parameter Store
    name        = "/${var.environment}/${var.rgn_suffix}/alb-sg-id"
    # A description of the parameter
    description = "The ID of the ALB Security Group"
    # The type of the parameter
    type        = "SecureString"
    # The value of the parameter, which is the ID of the ALB Security Group
    value       = aws_security_group.alb_sg.id
}

# Save ECS Security Group ID in SSM Parameter Store
resource "aws_ssm_parameter" "ecs_sg_id" {
    # The name of the parameter in the SSM Parameter Store
    name        = "/${var.environment}/${var.rgn_suffix}/ecs-sg-id"
    # A description of the parameter
    description = "The ID of the ECS Security Group"
    # The type of the parameter
    type        = "SecureString"
    # The value of the parameter, which is the ID of the ECS Security Group
    value       = aws_security_group.ecs_sg.id
}

# Save WAF ACL ARN in SSM Parameter Store
resource "aws_ssm_parameter" "waf_acl_arn" {
    # The name of the parameter in the SSM Parameter Store
    name        = "/${var.environment}/${var.rgn_suffix}/waf-acl-arn"
    # A description of the parameter
    description = "The ARN of the WAF ACL"
    # The type of the parameter
    type        = "SecureString"
    # The value of the parameter, which is the ARN of the WAF ACL
    value       = aws_wafv2_web_acl.waf_acl.arn
}

