#Store Jump Server Security Group ID in SSM Parameter Store
resource "aws_ssm_parameter" "jump_server_sg_id" {
  name  = "/${var.environment}/${var.project_name}/jump_server_sg_id"
  type  = "String"
  value = aws_security_group.jump-server-sg.id
}

#Store ALB Security Group ID in SSM Parameter Store
resource "aws_ssm_parameter" "alb_sg_id" {
    name  = "/${var.environment}/${var.project_name}/alb_sg_id"
    type  = "String"
    value = aws_security_group.alb-sg.id        
}    

#Store ECS Security Group ID in SSM Parameter Store
resource "aws_ssm_parameter" "ecs_sg_id" {
    name  = "/${var.environment}/${var.project_name}/ecs_sg_id"
    type  = "String"
    value = aws_security_group.ecs-sg.id        
}    

#Store MySQL Security Group ID in SSM Parameter Store
resource "aws_ssm_parameter" "mysql_sg_id" {
    name  = "/${var.environment}/${var.project_name}/mysql_sg_id"
    type  = "String"
    value = aws_security_group.mysql-sg.id        
}      

#Store WAf ACL ID in SSM Parameter Store
resource "aws_ssm_parameter" "waf_acl_id" {
    name  = "/${var.environment}/${var.project_name}/waf_acl_id"
    type  = "String"
    value = aws_wafv2_web_acl.waf_acl.id        
}