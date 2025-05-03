#Create security group for jump-server no inbound rules
# This security group is for the jump server, which typically has no inbound rules to restrict access.
resource "aws_security_group" "jump-server-sg"{
  name        = local.jump-server_sg_name
  description = "Security group for the jump server"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value

  #Allow SSH access from the specified IP address
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.public_destination_cidr]
  }
  
 tags = merge(
    local.common_tags,
    {
      Name = local.jump-server_sg_name
    }
  )    
  }

#Create security group for ALB with inbound rules
# This security group is for the Application Load Balancer (ALB), which typically has inbound rules to allow HTTP and HTTPS traffic.
#Allow SSH access from the jump server security group
  
  resource "aws_security_group" "alb-sg" {
  name        = local.alb_sg_name
  description = "Security group for the Application Load Balancer (ALB)"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value

 #Allow HTTP traffic
  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = [var.public_destination_cidr]
   
  }
  #Allow HTTPS traffic
  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = [var.public_destination_cidr]
  }

#Allow SSH access from the jump server security group
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    security_groups = [aws_security_group.jump-server-sg.id]
  }  

 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.public_destination_cidr]
  }

tags = merge(
    local.common_tags,
    {
      Name = local.alb_sg_name
    }
  )    
}

#Create Security Group for ECS with inbound rules
# This security group is for the Elastic Container Service (ECS), which typically has inbound rules to allow traffic from the ALB security group.
#Allow SSH access from the jump server security group

resource "aws_security_group" "ecs-sg" {
  name        = local.ecs_sg_name
  description = "Security group for the ECS"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value

  #Allow HTTP traffic from the ALB security group
  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    security_groups = [aws_security_group.alb-sg.id]
  }

  #Allow HTTPS traffic from the ALB security group
  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    security_groups = [aws_security_group.alb-sg.id]
  }
    #Allow SSH access from the jump server security group
    ingress {
      from_port   = var.ssh_port
      to_port     = var.ssh_port
      protocol    = "tcp"
      security_groups = [aws_security_group.jump-server-sg.id]
    }
     
     tags = merge (
    local.common_tags,
    {
      Name = local.ecs_sg_name
    }
  )

}
  
  #Create Security Group for RDS MySQL with inbound rules
  # This security group is for the Relational Database Service (RDS), which typically has inbound rules to allow traffic from the ECS security group. 
  #Allow SSH access from the jump server security group

resource "aws_security_group" "mysql-sg" {
  name        = local.mysql_sg_name
  description = "Security group for the MySQL RDS"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value

  #Allow MySQL traffic from the ECS security group
  ingress {
    from_port   = var.mysql_port
    to_port     = var.mysql_port
    protocol    = "tcp"
    security_groups = [aws_security_group.ecs-sg.id]
  }

  #Allow SSH access from the jump server security group
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    security_groups = [aws_security_group.jump-server-sg.id]
  }
  
  tags = merge(
    local.common_tags,
    {
      Name = local.mysql_sg_name
    }
  )    
}
