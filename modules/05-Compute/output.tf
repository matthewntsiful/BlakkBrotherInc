output "jump_server_id" {
  description = "ID of the jump server"
  value       = aws_instance.jump_server.id
}

output "jump_server_public_ip" {
  description = "Public IP of the jump server"
  value       = aws_instance.jump_server.public_ip
}

output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.ecr_repo.repository_url
}

output "ecs_cluster_id" {
  description = "ID of the ECS cluster"
  value       = aws_ecs_cluster.cluster.id
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  value       = aws_ecs_cluster.cluster.name
}

output "ecs_service_id" {
  description = "ID of the ECS service"
  value       = aws_ecs_service.service.id
}

output "ecs_task_definition_arn" {
  description = "ARN of the ECS task definition"
  value       = aws_ecs_task_definition.task.arn
}

output "ecs_task_definition_family" {
  description = "Family of the ECS task definition"
  value       = aws_ecs_task_definition.task.family
}