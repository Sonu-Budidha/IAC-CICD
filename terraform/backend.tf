terraform {
  backend "s3" {
    bucket         = "hfhdfgdhfgdhfgdhgdhgdhgdj"
    key            = "project/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

