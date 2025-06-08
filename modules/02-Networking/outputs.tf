# VPC Outputs
output "vpc_cidr" {
  description = "The CIDR block of the VPC created by this module"
  value       = aws_vpc.main_vpc.cidr_block
}

output "vpc_id" {
  description = "The ID of the VPC created by this module"
  value       = aws_vpc.main_vpc.id
}

# Subnet Outputs
output "web_subnet_ids" {
  description = "IDs of the web subnets"
  value       = aws_subnet.web_subnet[*].id
}

output "app_subnet_ids" {
  description = "IDs of the app subnets"
  value       = aws_subnet.app_subnet[*].id
}

output "db_subnet_ids" {
  description = "IDs of the database subnets"
  value       = aws_subnet.db_subnet[*].id
}

# Route Table Outputs
output "public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public_route_table.id
}

output "app_route_table_id" {
  description = "ID of the app route table"
  value       = aws_route_table.app_route_table.id
}

output "db_route_table_id" {
  description = "ID of the database route table"
  value       = aws_route_table.db_route_table.id
}

# Gateway Outputs
output "igw_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.main_igw.id
}

output "ngw_id" {
  description = "ID of the NAT Gateway"
  value       = aws_nat_gateway.nat_gateway.id
}
