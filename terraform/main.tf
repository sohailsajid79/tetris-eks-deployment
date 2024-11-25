module "aws_ecr_repository" {
  source              = "./modules/ecr"
  ecr_repository_name = "tetris-js-app"
}