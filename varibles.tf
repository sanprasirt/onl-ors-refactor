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


variable "aws_secure_subnets" {
  description = "The list of private subnets ids"
  type        = list(string)
  default     = ["subnet-0d348a10be7d17ec9", "subnet-0bb74d817ebb19227"]
}

variable "aws_app_subnets" {
  description = "The list of private subnets ids"
  type        = list(string)
  default     = ["subnet-00c5c5986096d3d47", "subnet-061a3048328327918"]
}

variable "environment" {
  description = "The evironment of resource"
  type        = string
  default     = "dev"
}