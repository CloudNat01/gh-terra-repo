terraform {
  backend "s3" {
    bucket = "tfst-bk"
    key    = "tfst-bk"
    region = "us-east-1"
  }
}
