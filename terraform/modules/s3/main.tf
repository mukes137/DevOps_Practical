resource "aws_s3_bucket" "backend" {
  bucket = "my-terraform-bucket-for-state-files"
  acl    = "private"

  tags = {
    Name = "Terraform Bucket For State Files "
  }
}

resource "aws_dynamodb_table" "db" {
  name           = "terraform-state-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket         = "my-terraform--bucket-for-state-files"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
  }
}

