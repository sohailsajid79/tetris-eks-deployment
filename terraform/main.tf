module "aws_ecr_repository" {
  source              = "./modules/ecr"
  ecr_repository_name = "tetris-js-app"
}

module "vpc" {
  source          = "./modules/vpc"
  vpc_name        = "webapp-vpc"
  vpc_cidr        = "10.0.0.0/16"
  azs             = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

module "eks" {
  source            = "./modules/eks"
  cluster_name      = var.cluster_name
  cluster_version   = "1.27"
  vpc_id            = module.vpc.vpc_id
  public_subnets    = module.vpc.public_subnets
  private_subnets   = module.vpc.private_subnets
  iam_role_name     = "controller"
  node_desired_size = 2
  node_min_size     = 1
  node_max_size     = 3
}

module "irsa" {
  source                        = "./modules/irsa"
  oidc_provider_arn             = module.eks.oidc_provider_arn
  cert_manager_irsa_name        = "cert-manager-irsa-role"
  external_dns_irsa_name        = "external-dns-irsa-role"
  cert_manager_hosted_zone_arns = ["arn:aws:route53:::hostedzone/Z01680642RO6GP0HFFCQ6"]
  external_dns_hosted_zone_arns = ["arn:aws:route53:::hostedzone/Z01680642RO6GP0HFFCQ6"]
}

module "helm" {
  source                     = "./modules/helm"
  helm_resource_ingress_name = "nginx-ingress"
  helm_resource_certmgr_name = "cert-manager"
  helm_resource_extdns_name  = "external-dns"
  cert_manager_irsa_role_arn = module.irsa.cert_manager_irsa_role_arn
  external_dns_irsa_role_arn = module.irsa.external_dns_irsa_role_arn
}