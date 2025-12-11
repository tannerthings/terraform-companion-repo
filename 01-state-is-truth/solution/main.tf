terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "terraform-tutorial-${random_id.bucket_suffix.hex}"
  
  tags = {
    Purpose     = "Learning Terraform State"
    ManagedBy   = "Terraform"
    Environment = "Dev"
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

output "bucket_name" {
  value       = aws_s3_bucket.example.bucket
  description = "Name of the S3 bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.example.arn
  description = "ARN of the S3 bucket"
}
