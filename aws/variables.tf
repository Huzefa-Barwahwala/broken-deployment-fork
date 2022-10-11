variable "vm_ssh_pub_key" {
  description = "Public ssh key value - for vm access"
}

variable "instance_type" {
  description = "Value of the Instance Type for the EC2 instance"
  type        = string
}

variable "aws_vpc_cidr" {
  description = "Value of the Instance Type for the EC2 instance"
}

variable "aws_subnet_cidr" {
  description = "Value of the Instance Type for the EC2 instance"
}

variable "region" {
  description = "Value of the Instance Type for the EC2 instance"
}

variable "access_key" {
  description = "Value of the access key for aws account"
}

variable "secret_key" {
  description = "Value of the secret key for aws account"
}