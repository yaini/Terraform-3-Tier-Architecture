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

  container_definition = {
    name      = "ecs-container-definition"
    image     = aws_ecr_repository.ecr.repository_url
    cpu       = 2
    memory    = 2048
    essential = true
    portMappings = [
      {
        containerPort = 80
        hostPort      = 80
      }
    ]
  }

  entire_cidr_block = "0.0.0.0/0"
}