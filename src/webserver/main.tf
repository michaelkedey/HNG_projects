module "vpc" {
  source = "./modules/vpc"
}

module "nginx_server" {
  source = "./modules/nginx"
  subnet = module.vpc.subnet_id
  sg     = [module.vpc.sg]
}

