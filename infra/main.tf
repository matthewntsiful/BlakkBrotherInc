# Create IAM Module
module "iam" {
    source = "../modules/04-Iam"
    region = var.region
    owner = var.owner
    environment = var.environment
    ssm_policy_arns = var.ssm_policy_arns
    ecs_task_policy_arns = var.ecs_task_policy_arns
    ecs_execution_policy_arns = var.ecs_execution_policy_arns
    #ecs_service_policy_arns = var.ecs_service_policy_arns
    s3_policy_arns = var.s3_policy_arns
}

# Create Storage Module
module "storage" {
    source = "../modules/01-Storage"
    region = var.region
    owner = var.owner
    environment = var.environment
    s3_bucket_name = var.s3_bucket_name
}

# Create Networking Module
module "networking" {
    source = "../modules/02-Networking"
    region = var.region
    owner = var.owner
    environment = var.environment
    rgn_suffix = var.rgn_suffix
    az_count = var.az_count
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
    igw_name = var.igw_name
    ngw_name = var.ngw_name
    nat_eip_name = var.nat_eip_name
    public_route_table_name = var.public_route_table_name
    app_route_table_name = var.app_route_table_name  
    db_route_table_name = var.db_route_table_name
    web_subnet_name = var.web_subnet_name
    app_subnet_name = var.app_subnet_name
    db_subnet_name = var.db_subnet_name
    
    depends_on = [ module.storage, module.iam ]
   
}

# Create Security Module
module "security" {
    source = "../modules/03-Security"
    region = var.region
    owner = var.owner
    environment = var.environment
    rgn_suffix = var.rgn_suffix
    vpc_id = module.networking.vpc_id
    jump_server_sg_name = var.jump_server_sg_name
    alb_sg_name = var.alb_sg_name
    ecs_sg_name = var.ecs_sg_name
    rds_sg_name = var.rds_sg_name
    waf_acl_name = var.waf_acl_name
    waf_acl_metric_name = var.waf_acl_metric_name
    http_port = var.http_port
    https_port = var.https_port
    ssh_port = var.ssh_port
    mysql_port = var.mysql_port

    depends_on = [ module.networking, module.iam ]
}


# Create Compute Module
module "compute" {
    source = "../modules/05-Compute"
    
    region = var.region
    owner = var.owner
    environment = var.environment
    rgn_suffix = var.rgn_suffix
    az_count = var.az_count
    alb_https_listener_port = var.alb_https_listener_port
    container_port = var.container_port
    wildcard_domain_name = var.wildcard_domain_name

    depends_on = [ module.security, module.networking, module.storage, module.iam]
}
