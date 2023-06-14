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


# output network stack
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "yaya-tf-state"
    key    = "terraform/networking/terraform.tfstate"
    region = "ca-central-1"
  }
}

#  output cluster stack
data "terraform_remote_state" "cluster" {
  backend = "s3"
  config = {
    bucket = "yaya-tf-state"
    key    = "terraform/cluster/terraform.tfstate"
    region = "ca-central-1"
  }
}

resource "aws_db_instance" "crd_rds_tf" {
  allocated_storage            = 20
  db_name                      = var.crd_db_tf
  allow_major_version_upgrade  = true
  auto_minor_version_upgrade   = true
  backup_retention_period      = var.backup_retention_period
  engine                       = "postgres"
  engine_version               = var.engine_version
  instance_class               = var.instance_class
  identifier_prefix            = "cruddur-db-tf"
  username                     = var.username
  password                     = var.password
  deletion_protection          = var.deletion_protection
  performance_insights_enabled = true
  publicly_accessible          = true
  db_subnet_group_name         = aws_db_subnet_group.RDSsubnetGrp.id
  vpc_security_group_ids       = [aws_security_group.DB_SG_TF.id]
  skip_final_snapshot          = true

}

resource "aws_db_subnet_group" "RDSsubnetGrp" {
  name       = "rdssubnetgrp"
  subnet_ids = data.terraform_remote_state.network.outputs.PubSubIds

  tags = {
    Name = "RDSsubnetGrp"
  }
}

resource "aws_security_group" "DB_SG_TF" {
  name        = "DB_SG_TF"
  description = "SG for RDS"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id


  tags = {
    Name = "db_sg_tf"
  }
}

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.DB_SG_TF.id

  from_port                    = 5432
  referenced_security_group_id = data.terraform_remote_state.cluster.outputs.ServiceSG
  ip_protocol                  = "tcp"
  to_port                      = 5432
}