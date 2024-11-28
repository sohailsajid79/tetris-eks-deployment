resource "aws_eks_cluster" "my_cluster" {
  name     = var.cluster_name
  role_arn = var.eks_cluster_role

  vpc_config {
    subnet_ids = var.private_subnets
  }
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = var.eks_node_role
  subnet_ids      = var.private_subnets

  scaling_config {
    desired_size = var.node_desired_size
    max_size     = var.node_max_size
    min_size     = var.node_min_size
  }

  update_config {
    max_unavailable = var.max_unavailable
  }
}