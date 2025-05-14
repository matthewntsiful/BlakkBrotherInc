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
    name = "dev-blakkbrotherinc-us-east-1-vpc-id"
}
# Get IAM instance profile for jump server
data "aws_iam_instance_profile" "jump_profile" {
  name = "${local.name_prefix}-blakk-ssm-profile"
}

# Get IAM roles for ECS tasks
data "aws_iam_role" "ecs_task_exec_role" {
  name = "${local.name_prefix}-blakk-ecs-task-execution-role"
}

data "aws_iam_role" "ecs_task_role" {
  name = "${local.name_prefix}-blakk-ecs-task-role"
}

# Get SSM parameters
data "aws_ssm_parameter" "jump-server_sg_id" {
name = "${local.name_prefix}-blakk-jump-server-sg-id"
}

data "aws_ssm_parameter"web_subnet_ids {
  name = "${local.name_prefix}-blakk-web-subnet-ids"
}
data "aws_ssm_parameter" "db_subnet_ids" {
  name = "${local.name_prefix}-blakk-db-subnet-ids"
}
data "aws_ssm_parameter" "app_subnet_ids" {
  name = "${local.name_prefix}-blakk-app-subnet-ids"
} 
data "aws_ssm_parameter" "ecs_sg" {
 name = "${local.name_prefix}-blakk-ecs-sg-id"
}

# Retrieve JumpServer Subnet from SSM Parameter Store
data "aws_ssm_parameter" "jump_server_subnet_id" {
  name = "${local.name_prefix}-blakk-jump-server-subnet-id" 
}
# Retrieve ALB SG ID from SSM Parameter Store
data "aws_ssm_parameter" "alb_sg_id" {
  name = "${local.name_prefix}-blakk-alb-sg-id"
}

# Fetch WAF ACL ARN from SSM Parameter Store
data "aws_ssm_parameter" "waf_acl_id" {
  name = "${local.name_prefix}-blakk-waf-acl-id"
}
# Fetch WAF ARN from SSM Parameter Store
data "aws_ssm_parameter" "waf_acl_arn" {
  name = "${local.name_prefix}-blakk-waf-acl-arn"
}

# Get ACM Certificate
data "aws_acm_certificate" "acm_cert" {
  domain   = var.wildcard_domain_name
  statuses = ["ISSUED"]
  types = ["AMAZON_ISSUED"]
  
}