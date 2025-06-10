variable "aws_s3_bucket_name" {
    description = "S3 bucket name"
    default = "uc8-bucket-ecs"
}

variable "object_lock_enabled" {
    description = "Enable object lock"
    default = true
}

variable "tags" {
    description = "Tags for the S3 bucket"
    default = {
        Name        = "uc8-bucket"
        Environment = "dev"
    }
}
