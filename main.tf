provider "aws" {
  region = var.aws-region
}

module "vpc" {
  source              = "./modules/vpc"
  vpc-cidr-block      = var.vpc-cidr-block
  availability-zone   = var.availability-zone
  public-subnet-count = var.public-subnet-count
  project_name        = var.project-name
}

module "security-group" {
  source       = "./modules/security-group"
  project-name = var.project-name
  vpc-id       = module.vpc.vpc-id
}

module "ec2_instance" {
  source         = "./modules/ec2_instance"
  instance-count = var.instance-count
  ami-id         = var.ami-id
  instance-type  = var.instance-type
  subnet-ids     = module.vpc.public-subnet-ids
  sg-ec2-id      = module.security-group.sg-ec2
  project-name   = var.project-name

}

module "alb" {
  source       = "./modules/alb"
  project-name = var.project-name
  vpc-id       = module.vpc.vpc-id
  instance-ids = module.ec2_instance.instance-ids-created
  sg-alb-id    = module.security-group.alb-sg
  subnet_ids   = module.vpc.public-subnet-ids

}

module "cloudwatch" {
  source                = "./modules/cloudwatch"
  project-name          = var.project-name
  instance-ids          = module.ec2_instance.instance-ids-created
  scale-up-action-arn   = module.alb.scale-up-action-arn
  scale-down-action-arn = module.alb.scale-down-action-arn
}
