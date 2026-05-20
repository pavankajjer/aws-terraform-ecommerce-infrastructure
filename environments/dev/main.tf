module "vpc" {
  source      = "./modules/vpc"
  environment = var.environment
  vpc_cidr    = var.vpc_cidr
}

module "security_groups" {
  source = "./modules/security-groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source          = "./modules/ec2"
  subnet_id       = module.vpc.public_subnet_id
  security_group  = module.security_groups.web_sg
  environment     = var.environment
}

module "alb" {
  source          = "./modules/alb"
  subnet_ids      = module.vpc.public_subnets
  security_groups = [module.security_groups.alb_sg]
}