terraform {
  backend "s3" {
    bucket         = "yaya-tf-state"
    key            = "terraform/networking/terraform.tfstate"
    region         = "ca-central-1"
    dynamodb_table = "tf-state-lock"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = "~> 1.4.6"
}

provider "aws" {
  region     = var.AWS_DEFAULT_REGION
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.cruddur_vpc.id

  tags = {
    Name = "cruddur-igw"
  }
}