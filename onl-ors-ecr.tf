# aws_ecr_repository.onl-ors-reserve:
resource "aws_ecr_repository" "onl-ors-reserve" {
  image_tag_mutability = "MUTABLE"
  name                 = "${local.prefix}-reserve"
  tags                 = local.common_tags


  image_scanning_configuration {
    scan_on_push = false
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ecr_repository" "onl-ors-receive" {
  image_tag_mutability = "MUTABLE"
  name                 = "${local.prefix}-receive"
  tags                 = local.common_tags


  image_scanning_configuration {
    scan_on_push = false
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ecr_repository" "onl-ors-cancel" {
  image_tag_mutability = "MUTABLE"
  name                 = "${local.prefix}-cancel"
  tags                 = local.common_tags


  image_scanning_configuration {
    scan_on_push = false
  }
  lifecycle {
    create_before_destroy = true
  }
}