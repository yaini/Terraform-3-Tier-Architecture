locals {
  ecr_lifecycle_policy = {
    rules = [
      {
        rulePriority = 1
        description  = "keep last 10 images"
        action = {
          type = "expire"
        }
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 10
        }
      }
    ]
  }
}