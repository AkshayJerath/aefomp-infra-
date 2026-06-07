terraform {

  required_version = ">= 1.5"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

  }

}

provider "aws" {

  region = var.aws_region

}

# S3 Bucket

resource "aws_s3_bucket" "documents" {

  bucket = "aefomp-document-storage"

}

# RDS PostgreSQL

resource "aws_db_instance" "postgres" {

  identifier     = "aefomp-db"

  engine         = "postgres"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  username = "admin"

  password = "password123"

  skip_final_snapshot = true

}

# EKS Cluster

resource "aws_eks_cluster" "aefomp" {

  name     = "aefomp-cluster"

  role_arn = var.eks_role_arn

  version  = "1.29"

}