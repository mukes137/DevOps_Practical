variable "ami_id" {
  type = string
  default = "ami-0557a15b87f6559cf"
  description = "AMI ID to deploy EC2 instance"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "Type of instance to deploy" 
}

variable "vpc_id" {
  type = string
  default = "vpc-06c8545f702a3d5f7"
  description = "Create instance using this VPC"
}

variable "name"{
  type = string
  default = "mukesh-server"
  description = "Name of Instance"
}

variable "tags"{
  type = map(string)
  default = {}
  description = "A map of tags to add all resources"
}

variable "subnet_id"{
  type = string
  default = "subnet-0c1bd82bab903fd34"
  description = "Mukesh-subnetID"
}