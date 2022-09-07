terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.14.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "~>2.2.0"
    }
  }
  required_version = "~>1.0"
}

provider "aws" {
  region  = var.environment.inputs.aws_region
  access_key = var.environment.inputs.AWS_ACCESS_KEY_ID
  secret_key = var.environment.inputs.AWS_SECRET_ACCESS_KEY
} 
