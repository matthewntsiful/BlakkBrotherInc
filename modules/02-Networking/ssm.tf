#Store VPC ID in SSM Parameter Store
resource "aws_ssm_parameter" "vpc_id" {
    name  = "${local.name_prefix}-vpc-id"
    type  = "SecureString"
    value = aws_vpc.vpc.id
    tags  = local.common_tags
    

    depends_on = [ aws_vpc.vpc ]
    }

    #Store Internet Gateway ID in SSM Parameter Store
    resource "aws_ssm_parameter" "igw_id" {
    name  = "${local.name_prefix}-igw-id"
    type  = "SecureString"
    value = aws_internet_gateway.main.id
    tags  = local.common_tags
   
    depends_on = [ aws_internet_gateway.main ]
    }

    #Store Web Subnet ID in SSM Parameter Store
    resource "aws_ssm_parameter" "web_subnet_id" {
    count = var.az_count    
    name  = "/02-Networking/web-subnet-id-${count.index}"
    #name  = "${local.name_prefix}-web-subnet-id" 
    type  = "SecureString"
    value = aws_subnet.web[count.index].id
    tags  = local.common_tags
   
    depends_on = [ aws_subnet.web ]
    }

    #Store App Subnet ID in SSM Parameter Store
    resource "aws_ssm_parameter" "app_subnet_id" {
    count = var.az_count
    #name  = "/02-Networking/app-subnet-id-${count.index}"
    name  = "${local.name_prefix}-app-subnet-id"
    type  = "SecureString"
    value = aws_subnet.app[count.index].id
    tags  = local.common_tags

    overwrite = true

    depends_on = [ aws_subnet.app ]
    }


    #Store DB Subnet ID in SSM Parameter Store
    resource "aws_ssm_parameter" "db_subnet_id" {
    count = var.az_count
    name  = "/02-Networking/db-subnet-id-${count.index}"
    #name  = "${local.name_prefix}-db-subnet-id" 
    type  = "SecureString"
    value = aws_subnet.db[count.index].id
    tags  = local.common_tags
 
    depends_on = [ aws_subnet.db ]
    }

    #Store Public Route Table ID in SSM Parameter Store
    resource "aws_ssm_parameter" "public_rtb_id" {
    name  = "${local.name_prefix}-public-rtb-id"
    type  = "SecureString"
    value = aws_route_table.public.id
    tags  = local.common_tags
   
    depends_on = [ aws_route_table.public ]
    }

    #Store Private Route Table ID in SSM Parameter Store
    resource "aws_ssm_parameter" "private_rtb_id" {
    name  = "${local.name_prefix}-private-rtb-id"
    type  = "SecureString"
    value = aws_route_table.private.id
    tags  = local.common_tags
   
    depends_on = [ aws_route_table.private ]
    }

    #Store NAT Gateway ID in SSM Parameter Store
    resource "aws_ssm_parameter" "nat_gateway_id" {
    name  = "${local.name_prefix}-nat-gateway-id"
    type  = "SecureString"
    value = aws_nat_gateway.main.id
    tags  = local.common_tags
   
    depends_on = [ aws_nat_gateway.main ]
    }

    #Store NAT EIP ID in SSM Parameter Store
    resource "aws_ssm_parameter" "aws_nat_eip_id" {
    name  = "${local.name_prefix}-nat-eip-id"
    type  = "SecureString"
    value = aws_eip.nat.id
    tags  = local.common_tags
  
    depends_on = [ aws_eip.nat]
    }
    
    #Store VPC CIDR in SSM Parameter Store