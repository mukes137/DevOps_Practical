terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # version = "3.56.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  access_key = "${{ secrets.AWS_ACCESS_KEY_ID }}"
  secret_key = "${{ secrets.AWS_SECRET_ACCESS_KEY }}"
  region     = "us-east-1"
}


resource "aws_security_group" "ec2-sg"{
  name = "${var.name}-sg"
  description = "EC2 Security Group"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "sg-http"{
  type = "ingress"
  security_group_id = aws_security_group.ec2-sg.id
  from_port        = 80
  to_port          = 80
  protocol         = "TCP"
  cidr_blocks      = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "sg-https"{
  type = "ingress"
  security_group_id = aws_security_group.ec2-sg.id
  from_port        = 443
  to_port          = 443
  protocol         = "TCP"
  cidr_blocks      = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "sg-ssh"{
  type = "ingress"
  security_group_id = aws_security_group.ec2-sg.id
  from_port        = 22
  to_port          = 22
  protocol         = "TCP"
  cidr_blocks      = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "sg-egress"{
  type = "egress"
  security_group_id = aws_security_group.ec2-sg.id
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
}

resource "aws_instance" "server" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  key_name = "mukesh"
    root_block_device{
    volume_size = 8
    volume_type = "gp3"
    encrypted = true
  }
  tags = merge(
  var.tags,
  {
    Name              = var.name
    Environment       = "test"
    TTL               = "Apr 12"
  }
)
}