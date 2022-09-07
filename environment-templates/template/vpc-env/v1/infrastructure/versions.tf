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
  region  = local.local_data.aws_region
  access_key = local.local_data.AWS_ACCESS_KEY_ID
  secret_key =local.local_data.AWS_SECRET_ACCESS_KEY
} 
