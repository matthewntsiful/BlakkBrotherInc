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
variable "jump-server_sg" {
  description = "The name of the security group for the jump server."
  type        = string
  default     = "jump-server-sg"
}
variable "alb_sg" {
    description = "The name of the security group for the Application Load Balancer (ALB)."
    type        = string
    default     = "alb-sg" 

}
variable "ecs_sg" {
    description = "The name of the security group for the Amazon Elastic Container Service (ECS)."
    type        = string
    default     = "ecs-sg" 
}
variable "rds_sg" {
    description = "The name of the security group for the Amazon Relational Database Service (RDS)."
    type        = string
    default     = "rds-sg" 
}
variable "vpc_name" {
    description = "The name of the VPC."
    type        = string
    default     = "vpc" 
}