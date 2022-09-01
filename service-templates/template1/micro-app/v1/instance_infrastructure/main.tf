resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.service.inputs.namespace_name
  }
}
