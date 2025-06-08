# Local variables for the Storage module
# ======================================

# Create a local variable for the naming convention
# ------------------------------------------------
# The naming convention is: {owner}-{environment}-{region}
locals {
    name_prefix = "${var.owner}-${var.environment}-${var.region}"
}

# Create a local variable for the common tags
# --------------------------------------------
# The common tags are used to tag all resources in the module
locals {
    common_tags = {
        # The owner of the resources
        Owner       = var.owner
        # The environment the resources are in (e.g. dev, prod)
        Environment = var.environment
        # The region the resources are in
        Region      = var.region
    }
}

# Local variables for resource names
# ----------------------------------
# The S3 bucket name is created by concatenating the naming
# convention with the bucket name
locals {
    s3_bucket_name = "${local.name_prefix}-${var.s3_bucket_name}"
}
