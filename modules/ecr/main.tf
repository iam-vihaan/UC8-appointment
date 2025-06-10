resource "aws_ecr_repository" "uc8-bucket-ecr" {
  name                 = "uc8-bucket-ecr"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}
