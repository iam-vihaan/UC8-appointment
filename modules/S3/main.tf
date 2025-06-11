resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "kasi-hcl-bucket" {
  bucket = "kasi-hcl-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "kasi-hcl-bucket"
    Environment = "Dev"
  }
}

