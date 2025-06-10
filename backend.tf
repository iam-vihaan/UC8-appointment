terraform {
  backend "s3" {
    bucket       = "kasi-hcl-bucket-uc78-terraform-state-bucket"
    key          = "kasi-hcl-bucket-uc78/statefile.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
