terraform {
  backend "s3" {
    bucket         = "yaya-tf-state"
    key            = "terraform/service/terraform.tfstate"
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
  region = "ca-central-1"
}


data "terraform_remote_state" "cluster" {
  backend = "s3"
  config = {
    bucket = "yaya-tf-state"
    key    = "terraform/cluster/terraform.tfstate"
    region = "ca-central-1"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "yaya-tf-state"
    key    = "terraform/networking/terraform.tfstate"
    region = "can-central-1"
  }
}
