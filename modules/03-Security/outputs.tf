output "alb_sg_id" {
  description = "ID of the ALB Security Group"
  value       = aws_security_group.alb_sg.id
}

output "ecs_sg_id" {
  description = "ID of the ECS Security Group"
  value       = aws_security_group.ecs_sg.id
}

output "waf_acl_arn" {
  description = "ARN of the WAF ACL"
  value       = aws_wafv2_web_acl.waf_acl.arn
}

output "jump_server_sg_id" {
  description = "ID of the Jump Server Security Group"
  value       = aws_security_group.jump_server_sg.id
}

output "rds_sg_id" {
  description = "ID of the RDS Security Group"
  value       = aws_security_group.rds_sg.id
}
