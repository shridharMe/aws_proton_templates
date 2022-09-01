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

locals {
  local_data = jsondecode(file("../proton.auto.tfvars.json"))
}

provider "aws" {
  region  = local.local_data.environment.inputs.cluster_region
}


data "aws_eks_cluster" "cluster" {
  name =local.local_data.environment.inputs.cluster_name
}

provider "kubernetes" {
  host                   = local.local_data.environment.outputs.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      local.local_data.environment.outputs.cluster_name
    ]
  }
}
