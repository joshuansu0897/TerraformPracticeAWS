variable "region" {
  #type = "string"
  description = "Region on AWS to Deploy"
}

variable "instance_type" {
  #type = "string"
  description = "Instance type EC2 AWS"
}

variable "min_size" {
  description = "min_size of instances on aws_launch_configuration"
}

variable "desired_capacity" {
  description = "desired_capacity of instances on aws_launch_configuration"
}

variable "max_size" {
  description = "max_size of instances on aws_launch_configuration"
}

variable "public_elb_name" {
  #type = "string"
  description = "Is the name of security groups of public_subnet"
}

variable "private_elb_name" {
  #type = "string"
  description = "Is the name of security groups of private_subnet"
}

variable "public_sg_name" {
  #type = "string"
  description = "Is the name of security groups of public_subnet"
}

variable "public_sg_ingress" {
  #type = "list"
  description = "Ingress Rules to public_subnet"
}

variable "public_sg_egress" {
  #type = "list"
  description = "Egress Rules to public_subnet"
}

variable "private_sg_name" {
  #type = "string"
  description = "Is the name of security groups of private_subnet"
}

variable "private_sg_ingress" {
  #type = "list"
  description = "Ingress Rules to private_subnet"
}

variable "private_sg_egress" {
  #type = "list"
  description = "Egress Rules to public_subnet"
}

variable "vpc_main_id" {
  #type = "string"
  description = "Is the ID of main VPC"
}

variable "public_subnets" {
  #type = "list"
  description = "Is the list of publics subnets"
}

variable "private_subnets" {
  #type = "list"
  description = "Region on AWS to Deploy"
}
