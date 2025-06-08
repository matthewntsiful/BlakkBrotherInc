# Create a VPC with Flow Logs
resource "aws_vpc" "main_vpc" {
  # The CIDR block for the VPC
  cidr_block           = var.vpc_cidr
  # Enable DNS support
  enable_dns_support   = true
  # Enable DNS hostnames
  enable_dns_hostnames = true

  # Tags for the VPC
  tags = merge(local.common_tags, {
    Name = "${local.vpc_name}"
  })
}

# Create 2 Public Subnets Across 2 Availability Zones
resource "aws_subnet" "web_subnet" {
  # The number of subnets to create
  count = var.az_count
  # The VPC ID
  vpc_id            = aws_vpc.main_vpc.id
  # The CIDR block for each subnet
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  # The Availability Zone for each subnet
  availability_zone = data.aws_availability_zones.available.names[count.index]

  # Tags for each subnet
  tags = merge(local.common_tags, {
    Name = "${local.web_subnet_name}-${count.index + 1}"
    AName = "${local.name_prefix}-web-subnet-${data.aws_availability_zones.available.names[count.index]}"
    Type = "Public"
  })
}

# Create an Internet Gateway and attach it to the VPC
resource "aws_internet_gateway" "main_igw" {
  # The VPC ID
  vpc_id = aws_vpc.main_vpc.id

  # Tags for the Internet Gateway
  tags = merge(local.common_tags, {
    Name = "${local.igw_name}"
  })
}

# Create a Route Table for Public Subnets and associate it with the Web Subnets
resource "aws_route_table" "public_route_table" {
  # The VPC ID
  vpc_id = aws_vpc.main_vpc.id

  # A route for the Internet Gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  # Tags for the Route Table
  tags = merge(local.common_tags, {
    Name = "${local.public_route_table_name}"
  })
}

# Associate each Web Subnet with the Public Route Table
resource "aws_route_table_association" "web_subnet_assoc" {
  # The number of associations to create
  count = var.az_count
  # The subnet ID
  subnet_id      = aws_subnet.web_subnet[count.index].id
  # The Route Table ID
  route_table_id = aws_route_table.public_route_table.id
}

# Create 2 Private Subnets (App Subnets) Accross 2 Availability Zones
resource "aws_subnet" "app_subnet" {
  # The number of subnets to create
  count = var.az_count
  # The VPC ID
  vpc_id            = aws_vpc.main_vpc.id
  # The CIDR block for each subnet
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + 2)
  # The Availability Zone for each subnet
  availability_zone = data.aws_availability_zones.available.names[count.index]

  # Tags for each subnet
  tags = merge(local.common_tags, {
    Name = "${local.app_subnet_name}-${count.index + 1}"
    AName = "${local.name_prefix}-app-subnet-${data.aws_availability_zones.available.names[count.index]}"
    Type = "Private"
  })
}

# Create 2 Private Subnets (DB Subnets) Accross 2 Availability Zones
resource "aws_subnet" "db_subnet" {
  # The number of subnets to create
  count = var.az_count
  # The VPC ID
  vpc_id            = aws_vpc.main_vpc.id
  # The CIDR block for each subnet
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + 4)
  # The Availability Zone for each subnet
  availability_zone = data.aws_availability_zones.available.names[count.index]

  # Tags for each subnet
  tags = merge(local.common_tags, {
    Name = "${local.db_subnet_name}-${count.index + 1}"
    AName = "${local.name_prefix}-db-subnet-${data.aws_availability_zones.available.names[count.index]}"
    Type = "Private"
  })
}

# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "nat_eip" {
  # The domain for the Elastic IP
  domain = "vpc"

  # Tags for the Elastic IP
  tags = merge(local.common_tags, {
    Name = "${local.nat_eip_name}"
  })
}

# Create a NAT Gateway in one Public Subnet
resource "aws_nat_gateway" "nat_gateway" {
  # The allocation ID of the Elastic IP
  allocation_id = aws_eip.nat_eip.id
  # The subnet ID
  subnet_id     = aws_subnet.web_subnet[0].id

  # Tags for the NAT Gateway
  tags = merge(local.common_tags, {
    Name = "${local.ngw_name}"
  })

  # Explicitly depend on web subnet creation
  depends_on = [aws_subnet.web_subnet]
}

# Create a Route Table for App Subnets and associate it with the App Subnets
resource "aws_route_table" "app_route_table" {
  # The VPC ID
  vpc_id = aws_vpc.main_vpc.id

  # A route for the NAT Gateway
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  # Tags for the Route Table
  tags = merge(local.common_tags, {
    Name = "${local.app_route_table_name}"
  })
}

# Associate each App Subnet with the App Route Table
resource "aws_route_table_association" "app_subnet_assoc" {
  # The number of associations to create
  count = var.az_count
  # The subnet ID
  subnet_id      = aws_subnet.app_subnet[count.index].id
  # The Route Table ID
  route_table_id = aws_route_table.app_route_table.id
}

# Create a Route Table for DB Subnets and associate it with the DB Subnets
resource "aws_route_table" "db_route_table" {
  # The VPC ID
  vpc_id = aws_vpc.main_vpc.id

  # A route for the NAT Gateway
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  # Tags for the Route Table
  tags = merge(local.common_tags, {
    Name = "${local.db_route_table_name}"
  })
}

# Associate each DB Subnet with the DB Route Table
resource "aws_route_table_association" "db_subnet_assoc" {
  # The number of associations to create
  count = var.az_count
  # The subnet ID
  subnet_id      = aws_subnet.db_subnet[count.index].id
  # The Route Table ID
  route_table_id = aws_route_table.db_route_table.id
}

# Tag VPC Default Security Group as "Do not Use"
resource "aws_default_security_group" "default_sg" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "DefaultSG: Do not Use"
  }

  # Explicitly depend on VPC creation
  depends_on = [aws_vpc.main_vpc]
}

# Tag Default Route Table as "Do not Use"
resource "aws_default_route_table" "default_route_table" {
  default_route_table_id = aws_vpc.main_vpc.default_route_table_id

  # Explicitly depend on VPC creation
  depends_on = [aws_vpc.main_vpc]

  tags = {
    Name = "DefaultRT: Do not Use"
  }
}

# After the configuration, store resource IDs in the SSM Parameter store for later use
