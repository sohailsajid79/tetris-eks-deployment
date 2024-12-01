module "eks" {
  source                   = "terraform-aws-modules/eks/aws"
  version                  = "20.30.1"
  cluster_name             = var.cluster_name
  cluster_version          = var.cluster_version
  vpc_id                   = var.vpc_id
  subnet_ids               = var.private_subnets
  control_plane_subnet_ids = var.public_subnets
  enable_irsa              = true
  create_iam_role          = true
  iam_role_name            = var.iam_role_name


  eks_managed_node_group_defaults = {
    desired_capacity = var.node_desired_size
    min_capacity     = var.node_min_size
    max_capacity     = var.node_max_size
    instance_types   = ["t3.medium"]
    disk_size        = 50
  }

  eks_managed_node_groups = {
    default = {}
  }

  # cluster_encryption_config = {
  #   resources = ["secrets"]
  # }

  # API endpoint access
  cluster_endpoint_public_access       = true
  cluster_endpoint_private_access      = false
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
}