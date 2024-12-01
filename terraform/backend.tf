terraform {
  backend "s3" {
    bucket         = "tetris-app-remote-tfstate"
    key            = "terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name           = "terraform-lock-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}