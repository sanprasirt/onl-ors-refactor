# aws_ecr_repository.onl-ors-reserve:
resource "aws_ecr_repository" "onl-ors-reserve" {
  image_tag_mutability = "MUTABLE"
  name                 = "onl-ors-reserve"
  tags                 = local.common_tags


  image_scanning_configuration {
    scan_on_push = false
  }
}