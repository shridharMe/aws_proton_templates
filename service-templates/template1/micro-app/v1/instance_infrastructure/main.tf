locals {
  local_data = jsondecode(file("${path.module}/proton.auto.tfvars.json"))
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.service_instance.inputs.namespace_name
  }
}
