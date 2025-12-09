terraform {
  backend "s3" {
    bucket = "fklgjkjfghfjkghfjkghfjkghfjkgh"
    key    = "project/terraform.tfstate"
    region = "us-west-2"
    encrypt = true
  }
}

