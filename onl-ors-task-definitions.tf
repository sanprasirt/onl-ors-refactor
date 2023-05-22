# Create task definition
resource "aws_ecs_task_definition" "onl_ors_nginx_task" {
  family             = "${local.prefix}-nginx-service"
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  memory             = 512
  cpu                = 256
  network_mode       = "awsvpc"
  container_definitions = jsonencode([
    {
      name      = "${local.prefix}-nginx-service"
      image     = "public.ecr.aws/nginx/nginx:1.24"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
  tags = merge(
    local.common_tags,
    {
      Name = "${local.prefix}-nginx-service"
    }
  )
}

# Create Role execution tasks
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = <<EOF
    {
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
    }
    ]
    }
EOF
}

# data "aws_iam_policy_document" "ecs_task_execution_role_bk" {
#   statement {
#     actions = ["sts:AssumeRole"]
#     effect  = "Allow"

#     principals {
#       type        = "Service"
#       identifiers = ["ecs-tasks.amazonaws.com"]
#     }
#   }
# }

resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-policy-attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}