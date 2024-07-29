terraform {
  backend "s3" {
    bucket = "prodtfs321072023"
    key    = "terraform.tfstate"
    region = "eu-north-1"
    dynamodb_table = "terraform-state-lock"
  }
}