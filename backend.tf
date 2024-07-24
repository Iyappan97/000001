terraform {
  backend "s3" {
    bucket = "terra-backendfile"
    region = "us-east-1"
    key = "eks/terraform.tfstate"
  }
}