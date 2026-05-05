variable "region" {
  default = "eu-north-1"
}

variable "bucket_name" {
  default = "terraform-remote-state-bucket-192837465"
}

variable "environment" {
  default = "dev"
}

variable "lock_table" {
  default = "terraform-locks"
}