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