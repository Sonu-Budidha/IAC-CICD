terraform {
  backend "s3" {
    bucket         = "hfhdfgdhfgdhfgdhgdhgdhgdj"
    key            = "project/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

