data "aws_eks_cluster" "example" {
  name = var.environment.inputs.cluster_name
}