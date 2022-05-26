terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.0.2"
    }
  }
}
data "template_file" "credentials" {
  template = "${file("${path.module}/file/credentials.example")}"
  vars = {
    TERRAFORM_CLOUD_API_TOKEN = var.terraform_cloud_api_token
  }
}

provider "kubernetes" {
    config_path = "~/.kube/config"
}


// Create terraformrc secret for Operator
resource "kubernetes_secret" "terraformrc" {
  metadata {
    name      = "terraformrc"
    namespace = "edu"
  }

  data = {
    "credentials" = data.template_file.credentials.rendered
  }
}

// Create workspace secret for Operator
resource "kubernetes_secret" "workspacesecrets" {
  metadata {
    name      = "workspacesecrets"
    namespace = "edu"
  }

data = {
    "AWS_ACCESS_KEY_ID"     = var.aws_access_key_id
    "AWS_SECRET_ACCESS_KEY" = var.aws_secret_access_key
    "AWS_SESSION_TOKEN"     = var.aws_session_token
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

// Terraform Cloud Operator for Kubernetes helm chart
resource "helm_release" "operator" {
  name       = "terraform-operator"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "terraform"

  namespace = "edu"

  depends_on = [
    kubernetes_secret.terraformrc,
    kubernetes_secret.workspacesecrets
  ]
}
