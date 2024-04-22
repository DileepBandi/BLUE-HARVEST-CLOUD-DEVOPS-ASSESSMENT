variable "cluster_id" {
  type = string
}
variable "task_arn" {
  type = string
}
variable "lb_target_group_arn" {
  type = string
}
variable "default_subnet_a_id" {
  type = string
}
variable "default_subnet_b_id" {
  type = string
}
variable "security_group_id" {
  type = string
}


resource "aws_ecs_service" "app_service" {
  name            = "app-service-terraform"     # Name the service
  cluster         = var.cluster_id   # Reference the created Cluster
  task_definition = var.task_arn # Reference the task that the service will spin up
  launch_type     = "FARGATE"
  desired_count   = 3 # Set up the number of containers to 3

  load_balancer {
    target_group_arn = var.lb_target_group_arn # Reference the target group
    container_name   = "app-first-task"
    container_port   = 8080 # Specify the container port
  }

  network_configuration {
    subnets          = [var.default_subnet_a_id, var.default_subnet_b_id]
    assign_public_ip = true     # Provide the containers with public IPs
    security_groups  = [var.security_group_id] # Set up the security group
  }
}
