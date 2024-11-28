module "aws_ecr_repository" {
  source              = "./modules/ecr"
  ecr_repository_name = "tetris-js-app"
}

module "route53" {
  source            = "./modules/route53"
  zone_name         = "tetris.sohailsajid.dev" # Subdomain
  cname_record_name = "tetris.sohailsajid.dev"
  target_dns_name   = var.target_dns_name # Dynamically pass target DNS name
}

module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = "10.0.0.0/16"
  vpc_name             = "webapp-vpc"
  cluster_name         = "team-delta"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  public_subnet_count  = 2
  private_subnet_count = 2

}

module "security_group" {
  source = "./modules/security_group"
  name   = "eks-sg"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source    = "./modules/iam"
  role_name = "controller"
  cni_policy_arn = "arn:aws:iam::842676011025:policy/CustomEKSCNIPolicy"
}

module "eks" {
  source            = "./modules/eks"
  cluster_name      = "team-delta-cluster"
  private_subnets   = module.vpc.private_subnets
  eks_cluster_role  = module.iam.eks_cluster_role_arn
  eks_node_role     = module.iam.eks_node_role_arn
  node_desired_size = 3
  node_max_size     = 6
  node_min_size     = 2
  max_unavailable   = 1
}
