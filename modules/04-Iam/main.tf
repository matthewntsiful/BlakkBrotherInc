#  Create SSM Role for Jump Server
resource "aws_iam_role" "ssm_role" {
  name               = local.ssm_role_name
  assume_role_policy = data.aws_iam_policy_document.ssm_role_policy.json

  tags = merge(local.common_tags, {
    Name = local.ssm_role_name
  })
}

# Attach Permission Policies to SSM Role
resource "aws_iam_role_policy_attachment" "ssm_role_policy_attachment" {
  for_each   = toset(var.ssm_policy_arns)
  role       = aws_iam_role.ssm_role.name
  policy_arn = each.value
}

# Create SSM Instance Profile
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = local.ssm_profile_name
  role = aws_iam_role.ssm_role.name
}

# Create ECS Task Role
resource "aws_iam_role" "ecs_task_role" {
  name               = local.ecs_task_role_name
  assume_role_policy = file("${path.root}/Policies/ecs-assume-role-policy.json")

  tags = merge(local.common_tags, {
    Name = local.ecs_task_role_name
  })
}

# Attach Permission Policies to ECS Task Role
resource "aws_iam_role_policy_attachment" "ecs_task_policy_attachment" {
  for_each   = toset(var.ecs_task_policy_arns)
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = each.value
}

# Create ECS Execution Role
resource "aws_iam_role" "ecs_execution_role" {
  name               = local.ecs_execution_role_name
  assume_role_policy = file("${path.root}/Policies/ecs-assume-role-policy.json")

  tags = merge(local.common_tags, {
    Name = local.ecs_execution_role_name
  })
}

# Attach Permission Policies to ECS Execution Role
resource "aws_iam_role_policy_attachment" "ecs_execution_policy_attachment" {
  for_each   = toset(var.ecs_execution_policy_arns)
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = each.value
}

# Create ECS Task Execution Role
resource "aws_iam_role" "ecs_task_execution_role" {
  name               = local.ecs_task_execution_role_name
  assume_role_policy = file("${path.root}/Policies/ecs-assume-role-policy.json")

  tags = merge(local.common_tags, {
    Name = local.ecs_task_execution_role_name
  })
}

# Attach Permission Policies to ECS Task Execution Role
resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy_attachment" {
  for_each   = toset(var.ecs_task_policy_arns)
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = each.value
}

# # Create ECS Service Role
# resource "aws_iam_role" "ecs_service_role" {
#   name               = local.ecs_service_role_name
#   assume_role_policy = file("${path.root}/Policies/ecs-assume-role-policy.json")

#   tags = merge(local.common_tags, {
#     Name = local.ecs_service_role_name
#   })
# }

# # Attach Permission Policies to ECS Service Role
# resource "aws_iam_role_policy_attachment" "ecs_service_policy_attachment" {
#   for_each   = toset(var.ecs_service_policy_arns)
#   role       = aws_iam_role.ecs_service_role.name
#   policy_arn = each.value
# }

# Create IAM Role to Allow S3 Put and Get Access to S3 for Logging (for VPC, EC2, ELB)
resource "aws_iam_role" "s3_role" {
  name               = local.s3_role_name
  assume_role_policy = file("${path.root}/Policies/s3-assume-role-policy.json")

  tags = merge(local.common_tags, {
    Name = local.s3_role_name
  })
}
# Attach Permission Policies to S3 Role
resource "aws_iam_role_policy_attachment" "s3_role_policy_attachment" {
  for_each   = toset(var.s3_policy_arns)
  role       = aws_iam_role.s3_role.name
  policy_arn = each.value
}