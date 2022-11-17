locals {
  frontend_name_prefix = "frontend"
  backend_name_prefix = "backend"
  frontend_user_data   = templatefile("${path.module}/tpl/frontend_instance_userdata.sh.tpl", {})
  backend_user_data   = templatefile("${path.module}/tpl/backend_instance_userdata.sh.tpl", {})
}

module "vpc" {
  source             = "../vpc"
  name               = "vpc-${var.env}"
  cidr_block         = var.vpc_cidr_block
  public_subnets     = var.vpc_public_subnets
  private_subnets    = var.vpc_private_subnets
  availability_zones = var.vpc_availability_zones
  enable_nat_gateway = var.vpc_enable_nat_gateway
}

module "frontend_instance" {
  source             = "../ec2_instance"
  env                = var.env
  deployment_account = var.deployment_account
  name_prefix        = local.frontend_name_prefix
  vpc_id             = module.vpc.id
  user_data          = local.frontend_user_data
  instance_subnet_id = module.vpc.public_subnet_ids[0]
}

module "backend_instance" {
  source             = "../ec2_instance"
  env                = var.env
  deployment_account = var.deployment_account
  name_prefix        = local.backend_name_prefix
  vpc_id             = module.vpc.id
  user_data          = local.backend_user_data
  instance_subnet_id = module.vpc.public_subnet_ids[0]
}