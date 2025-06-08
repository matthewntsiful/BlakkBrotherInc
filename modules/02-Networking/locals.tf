# Local variables for naming conventions, common tags, and resource names
locals {
    # Naming convention: {owner}-{environment}-{region}
    name_prefix = "${var.owner}-${var.environment}-${var.region}"

    # Common tags for all resources
    common_tags = {
        Owner       = var.owner
        Environment = var.environment
        Region      = var.region
    }

    # Resource names
    vpc_name = "${local.name_prefix}-${var.vpc_name}"
    igw_name = "${local.name_prefix}-${var.igw_name}"
    web_subnet_name = "${local.name_prefix}-${var.web_subnet_name}"
    app_subnet_name = "${local.name_prefix}-${var.app_subnet_name}"
    db_subnet_name = "${local.name_prefix}-${var.db_subnet_name}"
    ngw_name = "${local.name_prefix}-${var.ngw_name}"
    nat_eip_name = "${local.name_prefix}-${var.nat_eip_name}"
    public_route_table_name = "${local.name_prefix}-${var.public_route_table_name}"
    app_route_table_name = "${local.name_prefix}-${var.app_route_table_name}"
    db_route_table_name = "${local.name_prefix}-${var.db_route_table_name}"
}
