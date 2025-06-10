resource "aws_s3_bucket" "kasi_hcl_bucket_uc8" {
  bucket = var.aws_s3_bucket_name
  object_lock_enabled = var.object_lock_enabled
  tags = var.tags
}
