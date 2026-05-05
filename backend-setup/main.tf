provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "backend_bucket" {
  bucket        = var.bucket_name
  force_destroy = true

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    Name        = "terraform-state-bucket-${terraform.workspace}"
    Environment = var.environment
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.lock_table
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  hash_key = "LockID"

  tags = {
    Name        = "terraform-locks-${terraform.workspace}"
    Environment = var.environment
  }
}
