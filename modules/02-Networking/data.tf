# Data Source for Availability Zones
# ==========================================================================
# This data source retrieves a list of Availability Zones (AZs) in the region
# specified by the AWS provider configuration. The list of AZs is filtered to
# only include those that are currently available.

data "aws_availability_zones" "available" {
  # Filter the list of AZs to only include those that are currently available
  state = "available"
}
