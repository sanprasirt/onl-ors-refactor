resource "aws_ecs_task_definition" "onl_ors_tasks" {
  for_each                 = toset(var.services_name)
  family                   = "${local.prefix}-${each.key}-service"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  memory                   = 512
  cpu                      = 256
  network_mode             = "awsvpc"
  requires_compatibilities = ["EC2"]
  container_definitions = jsonencode([
    {
      name      = "${local.prefix}-${each.key}-service"
      image     = "${var.repo_url}/onl-ors-${each.key}:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ],
      environment : [
        {
          "name" : "PORT",
          "value" : "3000"
        }
      ],
      logConfiguration : {
        logDriver : "awslogs",
        options : {
          awslogs-create-group : "true",
          awslogs-group : "/aws/ecs/onl-ors-ecs-cluster-dev",
          awslogs-region : var.aws_region,
          awslogs-stream-prefix : "${local.prefix}/${each.key}-service/ecs-task-${each.key}-service"
        }
      },
    }
  ])

  tags = merge(
    local.common_tags,
    {
      Name = "${local.prefix}-${each.key}-service"
    }
  )
}