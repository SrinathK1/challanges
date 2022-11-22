terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "xyz-test-bucket-21-11-2022"
    key    = "prod/terraform.state"
    region = "us-east-1"
  }
}