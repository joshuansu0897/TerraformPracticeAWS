variable "region" {
  #type = "string"
  description = "Region on AWS to Deploy"
}

variable "function_name_public" {
  #type = "string"
  description = "Name of public lambda"
}

variable "public_elb_endpoint" {
  #type = "string"
  description = "Endpoint of public ELB to use in public lambda"
}

variable "function_name_private" {
  #type = "string"
  description = "Name of private lambda"
}

variable "private_elb_endpoint" {
  #type = "string"
  description = "Endpoint of private/internal ELB to use in private lambda"
}

variable "private_subnets" {
  #type = "list"
  description = "Is the list of privates subnets"
}

variable "private_sg_id" {
  #type = "list"
  description = "Is the ID of securityGroup for private lambda"
}
