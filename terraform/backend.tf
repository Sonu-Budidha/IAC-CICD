terraform {
  backend "s3" {
    bucket         = "hfhdfgdhfgdhfgdhgddsdsdsdsdsdhgdhdssdgdj"
    key            = "project/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

