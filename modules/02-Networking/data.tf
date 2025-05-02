#Get Available Zones in the Region
data "aws_availability_zones" "available" {
  state = "available"
}

