# --------------------------------------------------------
# Networking Resource IDs in the SSM Parameter Store
# --------------------------------------------------------

#Store VPC ID in SSM Parameter Store
resource "aws_ssm_parameter" "vpc_id" {
    name  = "/${var.environment}/${var.region}/vpc_id"
    description = "The ID of the VPC"
    type  = "SecureString"
    value = aws_vpc.main_vpc.id
}

#Store Internet Gateway ID in SSM Parameter Store
resource "aws_ssm_parameter" "igw_id" {
    name  = "/${var.environment}/${var.region}/igw_id"
    description = "The ID of the Internet Gateway"
    type  = "SecureString"
    value = aws_internet_gateway.main_igw.id
}

#Store Wed Subnet ID in SSM Parameter Store
resource "aws_ssm_parameter" "web_subnet_id" {
    name  = "/${var.environment}/${var.region}/web_subnet_id"
    description = "The ID of the Web Subnet"
    type  = "SecureString"
    value = aws_subnet.web_subnet[0].id
}

#Store First Public Subnet ID For JumpBox
resource "aws_ssm_parameter" "jumpbox_subnet" {
    name  = "/${var.environment}/${var.region}/jumpbox_subnet"
    description = "The ID of the JumpBox Subnet"
    type  = "SecureString"
    value = aws_subnet.web_subnet[0].id
}

#Store App Subnet ID in SSM Parameter Store
resource "aws_ssm_parameter" "app_subnet_id" {
    name  = "/${var.environment}/${var.region}/app_subnet_id"
    description = "The ID of the App Subnet"
    type  = "SecureString"
    value = aws_subnet.app_subnet[0].id
}

#Store Database Subnet ID in SSM Parameter Store
resource "aws_ssm_parameter" "db_subnet_id" {
    name  = "/${var.environment}/${var.region}/db_subnet_id"
    description = "The ID of the Database Subnet"
    type  = "SecureString"
    value = aws_subnet.db_subnet[0].id
}
