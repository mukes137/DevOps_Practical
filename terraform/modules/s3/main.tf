resource "aws_s3_bucket" "backend" {
  bucket = "statefile-bucket"
  acl    = "private"

  tags = {
    Name     = "bucket for CICD"
    Used_for = "Terraform Bucket For State Files "
    Owner    = "Mukesh"
  }
}


terraform {
  backend "s3" {
    bucket = "my-terraform--bucket-for-state-files"
    key    = "terraform-statefile-collection"
    region = "us-east-1"

  }
}

