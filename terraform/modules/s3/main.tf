terraform {
  backend "s3" {
    bucket = "state-file-bucket"
    key    = "terraform-state-file-collection"
    region = "us-east-1"

  }
}
