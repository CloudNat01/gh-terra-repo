terraform {
  backend "s3" {
    bucket = "new-tfst-bk"
    key    = "new-tfst-bk"
    region = "us-east-1"
  }
}
