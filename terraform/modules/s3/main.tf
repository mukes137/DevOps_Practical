resource "aws_s3_bucket" "statefile" {
  bucket = "state-file-bucket"
  acl    = "private"

  tags = {
    Name     = "bucket for CICD"
    Used_for = "Terraform Bucket For State Files "
    Owner    = "Mukesh"
  }
}


terraform {
  backend "s3" {
    bucket = "state-file-bucket"
    key    = "terraform-state-file-collection"
    region = "us-east-1"

  }
}

