terraform {
  backend "s3" {
    bucket         = "aw-tf-stat-yayae"
    key            = "terraform.tfstate"
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
}

provider "aws" {
  region     = var.AWS_DEFAULT_REGION
}

resource "aws_codestarconnections_connection" "gh_codestar" {
  name          = "crd-codestar-tf"
  provider_type = "GitHub"
}