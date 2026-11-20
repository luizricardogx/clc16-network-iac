terraform {
  backend "s3" {
    bucket = "terraform-state-luiz-clc16-846801117125-us-east-1-an"
    key    = "terraform/state"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}