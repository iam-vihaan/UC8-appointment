resource "aws_ecr_repository" "kasi_hcl_repo" {
  name                 = "kasi_hcl-repo"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}
