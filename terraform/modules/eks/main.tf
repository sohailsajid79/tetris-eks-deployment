#create the eks cluster

resource "aws_eks_cluster" "my-cluster" {
  name     = "my-cluster"

# makes sure these dependencies are created before eks creates a cluster as they depend on them
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
  ]

  role_arn = aws_iam_role.example.arn

      vpc_config {
        subnet_ids = [aws_subnet.example1.id, aws_subnet.example2.id]

  }

}

# create eks node group


resource "aws_eks_node_group" "example" {
  cluster_name    = "my-cluster"
  node_group_name = "my-node_group"
  node_role_arn   = aws_iam_role.example.arn
  subnet_ids      = aws_subnet.example[*].id

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }


  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
}






