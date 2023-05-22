
# resource "aws_ecs_service" "onl_ors_nginx_service" {
#   name            = "onl-ors-nginx-service"
#   cluster         = module.ecs_cluster.name
#   task_definition = aws_ecs_task_definition.onl_ors_nginx_task.arn
#   desired_count   = 1
#   #   iam_role        = aws_iam_role.ecs_task_execution_role.arn
#   #   depends_on      = [aws_iam_role_policy.aws_iam_role_policy_attachment.ecs-task-execution-role-policy-attachment]
#   scheduling_strategy               = "REPLICA"
#   enable_ecs_managed_tags           = true
#   health_check_grace_period_seconds = 30
#   load_balancer {
#     target_group_arn = module.alb.target_group_arns[0]
#     container_name   = "${local.prefix}-nginx-service"
#     container_port   = 80
#   }

#   deployment_circuit_breaker {
#     enable = true
#     rollback = true
#   }

#   network_configuration {
#     subnets          = var.aws_nonexpose_subnets
#     assign_public_ip = false
#     security_groups  = [aws_security_group.ecs_nginx_task_sg.id]
#   }
# }


# resource "aws_security_group" "ecs_nginx_task_sg" {
#   name   = "${local.prefix}-ecs-task-sg"
#   vpc_id = var.vpc_id
#   ingress {
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }
#   ingress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     security_groups = ["${module.alb_sg.security_group_id}"]
#   }
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }
#   tags = {
#     Name = "${local.prefix}-ecs-task-sg"
#   }
# }