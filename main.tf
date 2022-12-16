#Module for all my VPC and related resources
module "vpc" {
  source = "./vpc_module"

  vpc_tag              = var.vpc_tag
  igw_name             = var.igw_name
  nat_tag              = var.nat_tag
  bastion_route_name   = var.bastion_route_name
  web_route_name       = var.web_route_name
  db_route_name        = var.db_route_name
  vpc_cidr             = var.vpc_cidr
  bastion_subnet_cidr  = var.bastion_subnet_cidr
  web_subnet_cidr      = var.web_subnet_cidr
  db_subnet_cidr       = var.db_subnet_cidr
  bastion_subnet_names = var.bastion_subnet_names
  web_subnet_names     = var.web_subnet_names
  db_subnet_names      = var.db_subnet_names
  db_sub_group_name    = var.db_sub_group_name
}

#Module for security groups
module "security_groups" {
  source = "./security_group_module"

  bastion_sg_name = var.bastion_sg_name
  web_sg_name     = var.web_sg_name
  db_sg_name      = var.db_sg_name
  vpc_id          = module.vpc.vpc_id

}

#Module for ec2 related resources
module "ec2" {
  source = "./ec2_module"

  bastion_instance_name = var.bastion_instance_name
  ami                   = var.ami
  instance_type         = var.instance_type
  vpc_id                = module.vpc.vpc_id
  bastion_subnets_id    = [module.vpc.bastion_subnets_id]
  web_subnets_id        = module.vpc.web_subnets_id
  bastion_sg_id         = module.security_groups.bastion_sg_id
  web_sg_id             = module.security_groups.web_sg_id
  web_lt_name           = var.web_lt_name
  key_name              = var.key_name
}

module "rds_mysql" {
  source = "./rds_mysql_module"

  db_name = var.db_name
  db_sg_id = module.security_groups.db_sg_id
  db_subnet_group = module.vpc.db_subnet_group
  db_sub_group_name = var.db_sub_group_name
  
}