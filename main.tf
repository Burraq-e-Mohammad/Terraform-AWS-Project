provider "aws" {
  region = var.region
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

locals {
  name_tag = var.instance_type == "t3.micro" ? "EC2-${terraform.workspace}" : "Standard Instance"
}

module "ec2_instance" {
  source = "./ec2-module"
  ami = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  instance_name = local.name_tag
}

module "s3_bucket" {
  source = "./s3-bucket-module"
  bucket_name = var.bucket_name
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}