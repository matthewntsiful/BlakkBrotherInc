data "aws_region" "current" {}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Retrive VPC ID from the SSM Parameter Store
data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.environment}/${var.region}/vpc_id"
}

# Get IAM instance profile for jump server
 data "aws_iam_instance_profile" "jump_profile" {
  name = "/${var.environment}/${var.region}/blakk-ssm-profile"
}

# Get IAM roles for ECS taskar
data "aws_iam_role" "ecs_task_exec_role" { 
  name = "/${var.environment}/${var.region}/blakk-ecs-task-execution-role"
}

data "aws_iam_role" "ecs_task_role" {
  name = "/${var.environment}/${var.region}/blakk-ecs-task-role"
}

# Get SSM parameters
data "aws_ssm_parameter" "jump_sg_id" {
  name = "/${var.environment}/${var.region}/jumpbo_sg_id"
}

data "aws_ssm_parameter" "web_subnet_ids" {
  name = "/${var.environment}/${var.region}/web_subnet/ids"
}

data "aws_ssm_parameter" "app_subnet_ids" {
  name = "/${var.environment}/${var.region}/app_subnet/ids"
}

data "aws_ssm_parameter" "ecs_sg" {
  name = "/${var.environment}/${var.region}/ecs_sg_id"
}

# Retrieve JumpBox Subnet from SSM Parameter Store
data "aws_ssm_parameter" "jumpbox_subnet" {
  name = "/${var.environment}/${var.region}/jumpbox_subnet"
}

# Retrieve ALB SG ID from SSM Parameter Store
data "aws_ssm_parameter" "alb_sg_id" {
  name = "/${var.environment}/${var.region}/alb_sg_id"
}

# Fetch WAF ACL ARN from SSM Parameter Store
data "aws_ssm_parameter" "waf_acl_arn" {
  name = "/${var.environment}/${var.region}/waf_acl_arn"
}

# Get ACM Certificate
data "aws_acm_certificate" "acm_cert" {
  domain   = var.wildcard_domain_name
  statuses = ["ISSUED"]
  types    = ["AMAZON_ISSUED"]
}

