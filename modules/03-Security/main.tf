#Create security group for jump-server no inbound rules
# This security group is for the jump server, which typically has no inbound rules to restrict access.
resource "aws_security_group" "jump-server-sg"{
  name        = local.jump-server_sg
  description = "Security group for the jump server"
  vpc_id      = aws_vpc.main.id

  ingress = { }
 
    egress = {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
 
 tags = merge(
    local.common_tags,
    {
      Name = local.jump-server_sg
    }
  )    
    }
}

#Create security group for ALB with inbound rules
# This security group is for the Application Load Balancer (ALB), which typically has inbound rules to allow HTTP and HTTPS traffic.
#Allow SSH access from the jump server security group
  
  resource "aws_security_group" "alb-sg" {
  name        = local.alb_sg
  description = "Security group for the Application Load Balancer (ALB)"
  vpc_id      = aws_vpc.main.id

 #Allow HTTP traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Allow HTTPS traffic
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Allow SSH access from the jump server security group
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.jump-server-sg.id]    

    }

}

#Create Security Group for ECS with inbound rules
# This security group is for the Elastic Container Service (ECS), which typically has inbound rules to allow traffic from the ALB security group.
#Allow SSH access from the jump server security group

resource "aws_security_group" "ecs-sg" {
  name        = local.ecs_sg
  description = "Security group for the ECS"
  vpc_id      = aws_vpc.main.id


  #Allow HTTP traffic from the ALB security group
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb-sg.id]
  }

  #Allow HTTPS traffic from the ALB security group
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.alb-sg.id]
  }
    #Allow SSH access from the jump server security group
    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      security_groups = [aws_security_group.jump-server-sg.id]
    }
  }
  
  #Create Security Group for RDS with inbound rules
  # This security group is for the Relational Database Service (RDS), which typically has inbound rules to allow traffic from the ECS security group. 
  #Allow SSH access from the jump server security group

resource "aws_security_group" "rds-sg" {
  name        = local.rds_sg
  description = "Security group for the Relational Database Service (RDS)"
  vpc_id      = aws_vpc.main.id

  #Allow traffic from the ECS security group
  ingress {
    from_port   = 3306
    to_port     = 3306  
    protocol    = "tcp"
    security_groups = [aws_security_group.ecs-sg.id]
  }

  #Allow SSH access from the jump server security group
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.jump-server-sg.id]
  }
}
