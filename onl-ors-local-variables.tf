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
  services_expose = {
    webapp = {
      container_port = 8080,
      target         = 0,
      route           = "/ORS2_POS_CLIENT47"
    },
    reserve = {
      container_port = 3000,
      target         = 1,
      route           = "/reserve"
    },
    search = {
      container_port = 3000,
      target         = 2,
      route           = "/search"
    },
    receive = {
      container_port = 3000,
      target         = 3,
      route           = "/receive"
    },
    confirm = {
      container_port = 3000,
      target         = 4,
      route           = "/confirm"
    },
    cancel = {
      container_port = 3000,
      target         = 5,
      route           = "/cancel"
    },
    webmonitor = {
      container_port = 8080,
      target         = 6,
      route           = "/onl-ors-webmonitor"
    },
  }

  target_groups = [
    {
      name             = "${local.prefix}-webapp-tg-${var.environment}"
      backend_protocol = "HTTP"
      backend_port     = 8080
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
    {
      name             = "${local.prefix}-webmonitor-tg-${var.environment}"
      backend_protocol = "HTTP"
      backend_port     = 8080
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
  ]
}
