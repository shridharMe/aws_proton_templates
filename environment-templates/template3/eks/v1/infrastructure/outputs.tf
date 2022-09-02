output "cluster_name" {
  value = data.aws_eks_cluster.cluster.name
}

 output "cluster_region" {
  value = var.environment.inputs.aws_region
}