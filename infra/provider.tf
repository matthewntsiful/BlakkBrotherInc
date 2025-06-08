# AWS Provider Configuration
# ==========================================================================
# This block configures the AWS provider, which allows Terraform to interact
# with AWS resources. The region is specified by a variable to ensure that
# resources are deployed in the desired geographical location.

provider "aws" {
  # The AWS region where resources will be deployed
  region = var.region
}
