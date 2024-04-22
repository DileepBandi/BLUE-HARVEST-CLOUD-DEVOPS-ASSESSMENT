resource "aws_ecs_service" "app_service" {
  name            = "app-service-terraform"     # Name the service
  cluster         = var.aws_ecs_cluster.my_cluster.id   # Reference the created Cluster
  task_definition = var.aws_ecs_task_definition.app_task.arn # Reference the task that the service will spin up
  launch_type     = "FARGATE"
  desired_count   = 3 # Set up the number of containers to 3

  load_balancer {
    target_group_arn = var.aws_lb_target_group.target_group.arn # Reference the target group
    container_name   = "app-first-task"
    container_port   = 8080 # Specify the container port
  }

  network_configuration {
    subnets          = [var.aws_default_subnet.default_subnet_a.id, var.aws_default_subnet.default_subnet_b.id]
    assign_public_ip = true     # Provide the containers with public IPs
    security_groups  = [var.aws_security_group.service_security_group.id] # Set up the security group
  }
}
