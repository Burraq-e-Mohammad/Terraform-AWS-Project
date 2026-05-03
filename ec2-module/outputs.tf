output "instance_public_ip" {
  value = aws_instance.my_ec2.public_ip
}

output "instance_name_tag" {
  value = var.instance_name
}

output "terraform_workspace" {
  value = terraform.workspace
}