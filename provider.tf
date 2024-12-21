terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.62.0"
    }
  }
  backend "s3" {
    bucket = "aws-s3-demo-pa1"
    key = "expense-infra-dev-backend-deploy"
    region = "us-east-1"
    dynamodb_table = "aws-dynamodb-demo-pa1"
  }

}
#provide authentication here
provider "aws" {
  region = "us-east-1"
}