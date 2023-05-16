locals {
  prefix = "onl-ors"
  common_tags = {
    Service     = "onl"
    System      = "ors"
    Owner       = "cpall"
    Environment = "dev"
    Createby    = "TechEx created by terraform"
    SR          = "-"
    Project     = "refactor"
  }
}
