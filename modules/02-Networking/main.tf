#Create the  resources for the networking module based on the ./02-Networking/locals.tf file ./02-Networking/variables.tf file

#Create the VPC resource
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = merge(
    local.common_tags,
    {
      Name = local.vpc_name
    }
  )
}

#Create the Internet Gateway resource
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    local.common_tags,
    {
      Name = local.igw_name
    }
  )
}

#Create Web Subnet resource
resource "aws_subnet" "web" {
  count = var.az_count
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr, var.subnet_bits, count.index) # var.web_subnet(var.vpc_cidr, var.subnet_bits, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
  tags = merge(
    local.common_tags,
    {
      Name = local.web_subnet_name
    }
  )
}

#Create App Subnet resource
resource "aws_subnet" "app" {
  count = var.az_count
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr, var.subnet_bits, count.index + var.az_count)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = false
  tags = merge(
    local.common_tags,
    {
      Name = local.app_subnet_name
    }
  )
}

#Create DB Subnet resource  
resource "aws_subnet" "db" {
  count = var.az_count
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr, var.subnet_bits, count.index + var.az_count * 2)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = false
  tags = merge(
    local.common_tags,
    {
      Name = local.db_subnet_name
    }
  )
}

#Create Public Route Table resource with route to Internet Gateway
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
    }
    tags = merge(
        local.common_tags,
        {
           Name = local.public_rtb_name
        }
    )
}

#Associate the public route table with the web subnets
resource "aws_route_table_association" "public" {
  count = var.az_count
  subnet_id = aws_subnet.web[count.index].id
  route_table_id = aws_route_table.public.id

  depends_on = [ aws_route_table.public ]
}

#Create Elastic IP resource for NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"
  tags = merge(
    local.common_tags,
    {
      Name = local.nat_eip_name
    }
  )
}

#Create NAT Gateway resource 
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.web[0].id
  tags = merge(
    local.common_tags,
    {
      Name = local.nat_gateway_name
    }
  )
  depends_on = [ aws_eip.nat]

}
#Create Private Route Table resource with route to NAT Gateway
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.public_destination_cidr
    nat_gateway_id = aws_nat_gateway.main.id
  }
  tags = merge(
    local.common_tags,
    {
       Name = local.private_rtb_name
    }
  )
}

#Associate the private route table with the app subnets.  
resource "aws_route_table_association" "private" {
  count = var.az_count
  subnet_id = aws_subnet.app[count.index].id
  route_table_id = aws_route_table.private.id

  depends_on = [ aws_route_table.private ]
}

#Associate the private route table with the db subnets.
resource "aws_route_table_association" "private_db" {
  count = var.az_count
  subnet_id = aws_subnet.db[count.index].id
  route_table_id = aws_route_table.private.id

  depends_on = [ aws_route_table.private ]
}

 