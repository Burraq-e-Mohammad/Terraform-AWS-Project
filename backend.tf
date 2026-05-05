terraform {
  backend "s3" {
    bucket         = "terraform-remote-state-bucket-192837465"
    key            = "dev/project/terraform.tfstate"
    region         = "eu-north-1"
    use_lockfile   = true
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}