# aws_ecs_service.onl_ors_reserv_service:
resource "aws_ecs_service" "onl_ors_reserv_service" {
  cluster                            = module.ecs_cluster.arn
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  enable_ecs_managed_tags            = true
  health_check_grace_period_seconds  = 0
  name                               = "${local.prefix}-reserv-service"
  scheduling_strategy                = "REPLICA"
  tags = merge(
    { Name = "${local.prefix}-reserv-service" },
    local.common_tags
  )
  task_definition = aws_ecs_task_definition.onl_ors_reserv_task.arn

  capacity_provider_strategy {
    base              = 1
    capacity_provider = "asg-1"
    weight            = 1
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  deployment_controller {
    type = "ECS"
  }

  load_balancer {
    container_name   = "${local.prefix}-reserv-service"
    container_port   = 3000
    target_group_arn = element(module.alb.target_group_arns, 1)
  }

  network_configuration {
    assign_public_ip = false
    # security_groups = [
    #   "sg-03cbb14f1d44c2243",
    # ]
    security_groups = [aws_security_group.ecs_task_sg.id]
    subnets         = var.aws_nonexpose_subnets
  }

  ordered_placement_strategy {
    field = "attribute:ecs.availability-zone"
    type  = "spread"
  }
  ordered_placement_strategy {
    field = "instanceId"
    type  = "spread"
  }
}
