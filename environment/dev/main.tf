module "dev_vpc" {
  source = "../../modules/vpc"
}


module "dev_security_group" {
  source   = "../../modules/security_group"
  sg_name  = "Kubernetes_sg"
  sg_name2 = "ansible_sg"
  vpc_id   = module.dev_vpc.vpc-id
}

module "dev_keypair" {
  source   = "../../modules/keypair"
  key_name = "USTIkey"
}

module "dev_master-node" {
  source                      = "../../modules/master"
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t3.medium"
  vpc_security_group_ids      = module.dev_security_group.allSG
  associate_public_ip_address = true
  key_name                    = module.dev_keypair.key_name
  subnet_id                   = module.dev_vpc.subnet-id
  az1                         = "us-east-1a"
}

module "dev_worker1-node" {
  source                      = "../../modules/worker1"
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.medium"
  vpc_security_group_ids      = module.dev_security_group.allSG
  associate_public_ip_address = true
  key_name                    = module.dev_keypair.key_name
  subnet_id1                  = module.dev_vpc.subnet-id
  az1a                        = "us-east-1a"
}

module "dev_worker2-node" {
  source                      = "../../modules/worker2"
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.medium"
  vpc_security_group_ids      = module.dev_security_group.allSG
  associate_public_ip_address = true
  key_name                    = module.dev_keypair.key_name
  subnet_id2                  = module.dev_vpc.subnet-id2
  az1b                        = "us-east-1b"
}

module "dev_ansible" {
  source                 = "../../modules/ansible_node"
  vpc_security_group_ids = [module.dev_security_group.AnsibleSG]
  subnet_id              = module.dev_vpc.subnet-id2
  availability_zone      = "us-east-1b"
  key_name               = module.dev_keypair.key_name
}

module "dev_loadbalancer" {
  source                 = "../../modules/loadbalancer"
  vpc_security_group_ids = [module.dev_security_group.allSG]
}

module "dev_loadbalancer_node" {
  source                      = "../../modules/loadbalancer_node"
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.medium"
  vpc_security_group_ids      = module.dev_security_group.allSG
  associate_public_ip_address = true
  key_name                    = module.dev_keypair.key_name
  subnet_id1                  = module.dev_vpc.subnet-id
  az1a                        = "us-east-1a"
}