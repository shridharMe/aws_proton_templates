resource "kubernetes_namespace" "namwspace" {
  metadata {
    name = var.service.inputs.namespace_name
  }
}