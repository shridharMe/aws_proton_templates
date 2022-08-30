resource "kubernetes_namespace" "namwspace" {
  metadata {
    name = local.local_data.environment.inputs.namespace_name
  }
}