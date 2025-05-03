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

#Store VPC ID in SSM Parameter Store
resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.environment}/${var.project_name}/vpc_id"
  type  = "String"
  value = aws_vpc.vpc.id
}

#Store VPC CIDR in SSM Parameter Store
resource "aws_ssm_parameter" "vpc_cidr" {
    name  = "/${var.environment}/${var.project_name}/vpc_cidr"
    type  = "String"
    value = aws_vpc.vpc.cidr_block
}   

