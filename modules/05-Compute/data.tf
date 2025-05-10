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
  name = "/${var.owner}/${var.environment}/${var.rgn_suffix}/vpc/id"
}

# Get IAM instance profile for jump server
data "aws_iam_instance_profile" "jump_profile" {
  name = "${local.name_prefix}-geek-ssm-profile"
}

# Get IAM roles for ECS tasks
data "aws_iam_role" "ecs_task_exec_role" {
  name = "ecsTaskExecutionRole"
}

data "aws_iam_role" "ecs_task_role" {
  name = "${local.name_prefix}-geek-ecs-task-role"
}

# Get SSM parameters
data "aws_ssm_parameter" "jump_sg_id" {
  name = "/${var.owner}/${var.environment}/${var.rgn_suffix}/jumpbox_sg_id"
}

data "aws_ssm_parameter" "web_subnet_ids" {
  name = "/${var.owner}/${var.environment}/${var.rgn_suffix}/web_subnet/ids"
}

data "aws_ssm_parameter" "app_subnet_ids" {
  name = "/${var.owner}/${var.environment}/${var.rgn_suffix}/app_subnet/ids"
}

data "aws_ssm_parameter" "ecs_sg" {
  name = "/${var.owner}/${var.environment}/${var.rgn_suffix}/ecs_sg_id"
}

# Retrieve JumpBox Subnet from SSM Parameter Store
data "aws_ssm_parameter" "jumpbox_subnet" {
  name = "/${local.name_prefix}/jumpbox_subnet"
}

# Retrieve ALB SG ID from SSM Parameter Store
data "aws_ssm_parameter" "alb_sg_id" {
  name = "/${var.owner}/${var.environment}/${var.rgn_suffix}/alb_sg_id"
}

# Fetch WAF ACL ARN from SSM Parameter Store
data "aws_ssm_parameter" "waf_acl_arn" {
  name = "/${var.owner}/${var.environment}/${var.rgn_suffix}/waf_acl_arn"
}

# Get ACM Certificate
data "aws_acm_certificate" "acm_cert" {
  domain   = var.wildcard_domain_name
  statuses = ["ISSUED"]
  types    = ["AMAZON_ISSUED"]
}