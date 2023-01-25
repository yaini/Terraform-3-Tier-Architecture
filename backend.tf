terraform {
  backend "s3" {
    bucket         = "yaini-terraform-tfstate"
    dynamodb_table = "terraform-lock"
    key            = "terraform/3-tier-architecture/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
  }
}