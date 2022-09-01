resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.service_instance.inputs.namespace_name
  }
}
