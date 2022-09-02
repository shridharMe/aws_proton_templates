data "aws_eks_cluster" "cluster" {
  name = var.environment.inputs.cluster_name
}