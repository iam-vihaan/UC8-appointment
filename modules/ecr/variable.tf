variable "aws_ecr_repo_name" {
    description = "ECR repository name"
    default = "kasi_hcl-repo"
}

variable "image_tag_mutability" {
    description = "Image tag mutability"
    default = "MUTABLE"
}

variable "scan_on_push" {
    description = "Scan on push"
    default = true
}
