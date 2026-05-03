output "instance_public_ip" {
  value = module.ec2_instance.instance_public_ip
}

output "instance_name_tag" {
  value = local.name_tag
}

output "my_bucket_name" {
  value = module.s3_bucket.my_bucket_name
}