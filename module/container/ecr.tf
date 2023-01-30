resource "aws_ecr_repository" "ecr" {
  name                 = "ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_lifecycle_policy" "ecr_lifecycle_policy" {
  repository = aws_ecr_repository.ecr.name

  policy = jsonencode(local.ecr_lifecycle_policy)
}