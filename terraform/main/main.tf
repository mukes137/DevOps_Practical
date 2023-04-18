terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # version = "~> 3.56.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region                        = "us-east-1"
  # profile                     = "default" 
  shared_credentials_files      = [ "~/.aws/credentials" ]
    
}

module "ec2" {
    source                      = "./terraform/modules/ec2"
}

module "s3" {
    source                      = "./terraform/modules/s3"
}
