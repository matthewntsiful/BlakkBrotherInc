# Create WAF to block Top 10 OWASP Attacks
resource "aws_wafv2_web_acl" "waf_acl" {
    name        = local.waf_acl_name
    scope       = "REGIONAL"
    description = "WAF ACL to block Top 10 OWASP Attacks"

    # Default action is to allow all traffic
    default_action {
        allow {}
    }

    # Visibility configuration for the WAF ACL
    visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = local.waf_acl_metric_name
        sampled_requests_enabled   = true
    }

    # Rule to block Top 10 OWASP Attacks
    rule {
        name     = "AWS-AWSManagedRulesCommonRuleSet"
        priority = 1

        # Override the default action to block traffic
        override_action {
            none {}
        }

        # Statement to block Top 10 OWASP Attacks
        statement {
            managed_rule_group_statement {
                name        = "AWSManagedRulesCommonRuleSet"
                vendor_name = "AWS"
            }
        }

        # Visibility configuration for the rule
        visibility_config {
            cloudwatch_metrics_enabled = true
            metric_name                = "AWS-AWSManagedRulesCommonRuleSet"
            sampled_requests_enabled   = true
        }
    }
}

# Create Security Group for Jump Server
# Allows SSH from my IP
resource "aws_security_group" "jump_server_sg" {
    name        = local.jump_server_sg_name
    description = "Security Group for Jump Server"
    vpc_id      = var.vpc_id

    # Allow SSH from my IP
    ingress {
        from_port   = var.ssh_port
        to_port     = var.ssh_port
        protocol    = "tcp"
        cidr_blocks = [var.vpc_cidr]
    }

    # Allow all traffic to exit the Jump Server
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge(local.common_tags, {
        Name = local.jump_server_sg_name
    })
}

# Create Security Group for ALB
# Allows HTTP and HTTPS traffic from the Internet
# Allows SSH from Jump Server
resource "aws_security_group" "alb_sg" {
    name        = local.alb_sg_name
    description = "Allows HTTP and HTTPS Traffic from Internet"
    vpc_id      = var.vpc_id

    # Allow HTTP traffic from the Internet
    ingress {
        from_port   = var.http_port
        to_port     = var.http_port
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Allow HTTPS traffic from the Internet
    ingress {
        from_port   = var.https_port
        to_port     = var.https_port
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Allow SSH traffic from the Jump Server
    ingress {
        from_port       = var.ssh_port
        to_port         = var.ssh_port
        protocol        = "tcp"
        security_groups = [aws_security_group.jump_server_sg.id]
    }

    # Allow all traffic to exit the ALB
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge(local.common_tags, {
        Name = local.alb_sg_name
    })
}

# Create Security Group for ECS
# Allows HTTP and HTTPS traffic from ALB
# Allows SSH from Jump Server
resource "aws_security_group" "ecs_sg" {
    name        = local.ecs_sg_name
    description = "Allows HTTP and HTTPS Traffic from ALB"
    vpc_id      = var.vpc_id

    # Allow HTTP traffic from the ALB
    ingress {
        from_port       = var.http_port
        to_port         = var.http_port
        protocol        = "tcp"
        security_groups = [aws_security_group.alb_sg.id]
    }

    # Allow HTTPS traffic from the ALB
    ingress {
        description     = "Allow Traffic from ALB"
        from_port       = 8080
        to_port         = 8080
        protocol        = "tcp"
        security_groups = [aws_security_group.alb_sg.id]
    }

    # Allow SSH traffic from the Jump Server
    ingress {
        from_port       = var.ssh_port
        to_port         = var.ssh_port
        protocol        = "tcp"
        security_groups = [aws_security_group.jump_server_sg.id]
    }

    # Allow all traffic to exit the ECS
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge(local.common_tags, {
        Name = local.ecs_sg_name
    })
}

# Create Security Group for RDS
# Allows MySQL traffic from ECS and Jump Server
resource "aws_security_group" "rds_sg" {
    name        = local.rds_sg_name
    description = "Allows MySQL Traffic from ECS"
    vpc_id      = var.vpc_id
    depends_on  = [aws_security_group.jump_server_sg, aws_security_group.ecs_sg]

    # Allow MySQL traffic from the ECS
    ingress {
        from_port       = var.mysql_port
        to_port         = var.mysql_port
        protocol        = "tcp"
        security_groups = [aws_security_group.ecs_sg.id, aws_security_group.jump_server_sg.id]
    }

    # Allow all traffic to exit the RDS
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge(local.common_tags, {
        Name = local.rds_sg_name
    })
}

