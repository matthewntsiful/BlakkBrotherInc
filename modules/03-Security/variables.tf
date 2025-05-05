#Set varibles for Security Module based on the ../modules/03-Security/loclas.tf

variable "environment" {
  description = "The environment in which the resources are deployed (e.g., dev, staging, prod)."
  type        = string
  default     = "dev" 
}

variable "project_name" {
  description = "The name of the project."
  type        = string
  default     = "my_project"
  
}
variable "region" {
  description = "The AWS region where the resources will be deployed."
  type        = string
  default     = "us-east-1"
}
variable "owner" {
  description = "The owner of the resources."
  type        = string
  default     = "team_name"
}

variable "vpc_name" {
    description = "The name of the VPC."
    type        = string
    default     = "vpc" 
}
variable ssh_port {
  description = "The port used for SSH connections."
  type        = number
  default     = 22
}

variable "my_ip" {
  description = "The IP address of the user."
  type        = string
  default     = "0.0.0.0/16" # Replace with your actual IP addres
}
variable "http_port" {
  description = "The port used for HTTP connections."
  type        = number
  default     = 80
}
variable "https_port" {
  description = "The port used for HTTPS connections."
  type        = number
  default     = 443
}
variable "mysql_port" {
  description = "The port used for MySQL connections."
  type        = number
  default     = 3306
}
variable "public_destination_cidr" {
  description = "The destination CIDR block for public traffic."
  type        = string
  default     = "0.0.0.0/0"
}
 

variable "jump-server_sg_name" {
  description = "The name of the security group for the jump server."
  type        = string
  default     = "jump-server-sg"
}
variable "alb_sg_name" {
    description = "The name of the security group for the Application Load Balancer (ALB)."
    type        = string
    default     = "alb-sg" 

}
variable "ecs_sg_name" {
    description = "The name of the security group for the Amazon Elastic Container Service (ECS)."
    type        = string
    default     = "ecs-sg" 
}
variable "mysql_sg_name" {
    description = "The name of the security group for the Amazon Relational Database Service (RDS)."
    type        = string
    default     = "rds-sg" 
}
variable "waf_acl_name" {
    description = "The name of the Web Application Firewall (WAF) access control list (ACL)."
    type        = string
    default     = "waf-acl" 
}
 variable waf_metric_name {
    description = "The name of the Web Application Firewall (WAF) metric."
    type        = string
    default     = "webACL"
}