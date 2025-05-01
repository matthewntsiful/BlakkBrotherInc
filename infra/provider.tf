# Configure the AWS Provider - defines the AWS provider configuration using the region variable
provider "aws" {
  region = var.region
}

# Terraform block - specifies version constraints and required providers
# - required_version: ensures Terraform CLI version 1.3.0 or higher
# - required_providers: defines AWS provider source and version constraint (~> 5.0)
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Uses semantic versioning to allow minor version updates within 5.x
    }
  }
}
