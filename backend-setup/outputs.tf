output "s3_bucket_name" {
  value = aws_s3_bucket.backend_bucket.id
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_locks.id
}