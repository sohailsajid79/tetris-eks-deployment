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
  source = "./modules/vpc"
}