terraform {
  backend "s3" {
    bucket = "tfs321072023"
    key    = "terraform.tfstate"
    region = "eu-north-1"
  }
}
