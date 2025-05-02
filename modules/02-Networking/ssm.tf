#Store VPC ID in SSM Parameter Store
resource "aws_ssm_parameter" "vpc_id" {
    name  = "${local.name_prefix}-vpc-id"
    type  = "String"
    value = aws_vpc.vpc.id
    tags  = local.common_tags
    }

    #Store Internet Gateway ID in SSM Parameter Store
    resource "aws_ssm_parameter" "igw_id" {
    name  = "${local.name_prefix}-igw-id"
    type  = "String"
    value = aws_internet_gateway.main.id
    tags  = local.common_tags
    }

    #Store Web Subnet ID in SSM Parameter Store
    resource "aws_ssm_parameter" "web_subnet_id" {
    name  = "${local.name_prefix}-web-subnet-id"
    type  = "String"
    value = aws_subnet.web.id
    tags  = local.common_tags
    }

    #Store App Subnet ID in SSM Parameter Store
    resource "aws_ssm_parameter" "app_subnet_id" {
    name  = "${local.name_prefix}-app-subnet-id"
    type  = "String"
    value = aws_subnet.app.id
    tags  = local.common_tags
    }

    #Store DB Subnet ID in SSM Parameter Store
    resource "aws_ssm_parameter" "db_subnet_id" {
    name  = "${local.name_prefix}-db-subnet-id"
    type  = "String"
    value = aws_subnet.db.id
    tags  = local.common_tags
    }

    #Store Public Route Table ID in SSM Parameter Store
    resource "aws_ssm_parameter" "public_rtb_id" {
    name  = "${local.name_prefix}-public-rtb-id"
    type  = "String"
    value = aws_route_table.public.id
    tags  = local.common_tags
    }

    #Store Private Route Table ID in SSM Parameter Store
    resource "aws_ssm_parameter" "private_rtb_id" {
    name  = "${local.name_prefix}-private-rtb-id"
    type  = "String"
    value = aws_route_table.private.id
    tags  = local.common_tags
    }

    #Store NAT Gateway ID in SSM Parameter Store
    resource "aws_ssm_parameter" "nat_gateway_id" {
    name  = "${local.name_prefix}-nat-gateway-id"
    type  = "String"
    value = aws_nat_gateway.main.id
    tags  = local.common_tags
    }

    #Store NAT EIP ID in SSM Parameter Store
    resource "aws_ssm_parameter" "nat_eip_id" {
    name  = "${local.name_prefix}-nat-eip-id"
    type  = "String"
    value = aws_eip.nat.id
    tags  = local.common_tags
    }
    
    #Store VPC CIDR in SSM Parameter Store