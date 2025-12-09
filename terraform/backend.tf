terraform {
  backend "s3" {
    bucket         = "auto-backend-bucket-12345"
    key            = "project/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

