# Variables for Compute Module
# Region
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

# Region Suffix
variable "rgn_suffix" {
  description = "AWS region suffix"
  type        = string
}

# AZ Count
variable "az_count" {
  description = "Number of AZs to use"
  type        = number
}

# Owner
variable "owner" {
  description = "Owner of the resources"
  type        = string
}

# Environment
variable "environment" {
  description = "Environment name"
  type        = string
}

# Jump Server Instance Type
variable "jump_server_instance_type" {
  description = "EC2 instance type for the jump server"
  type        = string
  default     = "t3.micro"
}

# Variable for Container Port
variable "container_port" {
  description = "Port on which the container is listening"
  type        = number
}

# Variable ALB HTTPS Listener Port
variable "alb_https_listener_port" {
  description = "HTTPS port for ALB listener"
  type        = number
}

# Variable for wildcard Domain Name
variable "wildcard_domain_name" {
  description = "Wildcard domain name for ALB"
  type        = string
}