locals {
  prefix = "onl-ors"
  common_tags = {
    Service     = "onl"
    System      = "ors"
    Owner       = "cpall"
    Environment = var.environment
    Createby    = "TechEx created by terraform"
    SR          = "-"
    Project     = "refactor"
  }
  services_expose = [
    "reserve",
    "search",
    "receive",
    "confirm",
    "cancel",
  ]
  
  target_groups = [
    {
      name             = "${local.prefix}-frontend-tg-${var.environment}"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "ip"
      health_check = {
        path                = "/"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 5
        unhealthy_threshold = 2
        matcher             = "200"
      }
    },
    {
      name             = "${local.prefix}-reserve-tg-${var.environment}"
      backend_protocol = "HTTP"
      backend_port     = 3000
      target_type      = "ip"
      health_check = {
        path                = "/health"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 5
        unhealthy_threshold = 2
        matcher             = "200"
      }
    },
    {
      name             = "${local.prefix}-search-tg-${var.environment}"
      backend_protocol = "HTTP"
      backend_port     = 3000
      target_type      = "ip"
      health_check = {
        path                = "/health"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 5
        unhealthy_threshold = 2
        matcher             = "200"
      }
    },
    {
      name             = "${local.prefix}-receive-tg-${var.environment}"
      backend_protocol = "HTTP"
      backend_port     = 3000
      target_type      = "ip"
      health_check = {
        path                = "/health"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 5
        unhealthy_threshold = 2
        matcher             = "200"
      }
    },
    {
      name             = "${local.prefix}-confirm-tg-${var.environment}"
      backend_protocol = "HTTP"
      backend_port     = 3000
      target_type      = "ip"
      health_check = {
        path                = "/health"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 5
        unhealthy_threshold = 2
        matcher             = "200"
      }
    },
    {
      name             = "${local.prefix}-cancel-tg-${var.environment}"
      backend_protocol = "HTTP"
      backend_port     = 3000
      target_type      = "ip"
      health_check = {
        path                = "/health"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 5
        unhealthy_threshold = 2
        matcher             = "200"
      }
    },
  ]
}
