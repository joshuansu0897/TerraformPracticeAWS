provider "aws" {
  region = var.region
}

module "vps" {
  source               = "./modules/vps"
  region               = var.region
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "network" {
  source = "./modules/network"
  region = var.region

  vpc_main_id     = module.vps.vpc_main_id
  public_subnets  = module.vps.public_subnets
  private_subnets = module.vps.private_subnets
}

module "instances" {
  source             = "./modules/instances"
  region             = var.region
  instance_type      = var.instance_type
  min_size           = var.min_size
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  public_elb_name    = var.public_elb_name
  private_elb_name   = var.private_elb_name
  public_sg_name     = var.public_sg_name
  public_sg_ingress  = var.public_sg_ingress
  public_sg_egress   = var.public_sg_egress
  private_sg_name    = var.private_sg_name
  private_sg_ingress = var.private_sg_ingress
  private_sg_egress  = var.private_sg_egress

  vpc_main_id     = module.vps.vpc_main_id
  public_subnets  = module.vps.public_subnets
  private_subnets = module.vps.private_subnets
}
