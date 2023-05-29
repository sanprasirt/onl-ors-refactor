variable "aws_region" {
  description = "The region resource deployed"
  default     = "ap-southeast-1"
}

variable "vpc_id" {
  default = "vpc-0fc8e78b2c6d05200"
}

variable "aws_nonexpose_subnets" {
  description = "The list of private subnets ids"
  type        = list(string)
  default     = ["subnet-00357a44212cc845f", "subnet-03b61d2d30d62e4ce"]
}

variable "noneexpose_subnets_cidr_blocks" {
  description = "The list of noneexpose subnets cidr blocks"
  type        = list(string)
  default     = ["100.64.0.0/18", "100.64.64.0/18"]
}

variable "aws_secure_subnets" {
  description = "The list of private subnets ids"
  type        = list(string)
  default     = ["subnet-0d348a10be7d17ec9", "subnet-0bb74d817ebb19227"]
}

variable "secure_subnets_cidr_blocks" {
  description = "The list of secure subnets cidr blocks"
  type        = list(string)
  default     = ["172.19.205.192/27", "172.19.205.224/27"]
}

variable "aws_app_subnets" {
  description = "The list of private subnets ids"
  type        = list(string)
  default     = ["subnet-00c5c5986096d3d47", "subnet-061a3048328327918"]
}

variable "app_subnets_cidr_blocks" {
  description = "The list of app subnets cidr blocks"
  type        = list(string)
  default     = ["172.19.205.128/27", "172.19.205.160/27"]
}

variable "environment" {
  description = "The evironment of resource"
  type        = string
  default     = "dev"
}

variable "mq_username" {
  description = "MQ User name"
  type        = string
  sensitive   = true
}

variable "redis_username" {
  description = "Redis User name"
  type        = string
  sensitive   = true
}

variable "mq_password" {
  description = "MQ Password"
  type        = string
  sensitive   = true
}

variable "redis_password" {
  description = "Redis Password"
  type        = string
  sensitive   = true
}
variable "repo_url" {
  description = "The url of ECR repository"
  type        = string
  default     = "802791533053.dkr.ecr.ap-southeast-1.amazonaws.com"
}
variable "services_name" {
  description = "The name of service"
  type        = map(any)
  default = {
    webapp = {
      port          = 8080,
      variable_port = "8080",
      cpu           = 512,
      memory        = 1024,
    },
    reserve = {
      port          = 3000,
      variable_port = "3000",
      cpu           = 256,
      memory        = 512,
    },
    search = {
      port          = 3000,
      variable_port = "3000",
      cpu           = 256,
      memory        = 512,
    },
    receive = {
      port          = 3000,
      variable_port = "3000",
      cpu           = 256,
      memory        = 512,
    },
    confirm = {
      port          = 3000,
      variable_port = "3000",
      cpu           = 256,
      memory        = 512,
    },
    cancel = {
      port          = 3000,
      variable_port = "3000",
      cpu           = 256,
      memory        = 512,
    },
    mq-consumer = {
      port          = 3000,
      variable_port = "3000",
      cpu           = 256,
      memory        = 512,
    },
    mq-consumer-product = {
      port          = 3000,
      variable_port = "3000",
      cpu           = 256,
      memory        = 512,
    },
  }
}