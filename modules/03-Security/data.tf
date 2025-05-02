#Retrrive VPC ID from SSM Parameter Store
data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.environment}/${var.project_name}/vpc_id"
}
