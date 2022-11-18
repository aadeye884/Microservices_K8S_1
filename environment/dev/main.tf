module "dev_vpc" {
  source = "../../modules/vpc"
}

module "dev_security_group" {
  source   = "../../modules/security_group"
  sg_name1  = "Kubernetes_sg"
  sg_name2 = "ansible_sg"
  vpc_id   = module.dev_vpc.vpc-id
}

module "dev_keypair" {
  source   = "../../modules/keypair"
  key_name = "UST1key"
}

module "dev_master1-node" {
  source                      = "../../modules/master1"
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.medium"
  vpc_security_group_ids      = module.dev_security_group.allSG
  associate_public_ip_address = true
  key_name                    = module.dev_keypair.key_name
  subnet_id1                   = module.dev_vpc.subnet-id1
  az1                         = "us-east-1a"
}

module "dev_master2-node" {
  source                      = "../../modules/master2"
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.medium"
  vpc_security_group_ids      = module.dev_security_group.allSG
  associate_public_ip_address = true
  key_name                    = module.dev_keypair.key_name
  subnet_id2                   = module.dev_vpc.subnet-id2
  az2                         = "us-east-1b"
}

module "dev_master3-node" {
  source                      = "../../modules/master3"
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.medium"
  vpc_security_group_ids      = module.dev_security_group.allSG
  associate_public_ip_address = true
  key_name                    = module.dev_keypair.key_name
  subnet_id3                   = module.dev_vpc.subnet-id3
  az3                         = "us-east-1c"
}

module "dev_worker1-node" {
  source                      = "../../modules/worker1"
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.medium"
  vpc_security_group_ids      = module.dev_security_group.allSG
  associate_public_ip_address = true
  key_name                    = module.dev_keypair.key_name
  subnet_id1                  = module.dev_vpc.subnet-id1
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

module "dev_worker3-node" {
  source                      = "../../modules/worker3"
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.medium"
  vpc_security_group_ids      = module.dev_security_group.allSG
  associate_public_ip_address = true
  key_name                    = module.dev_keypair.key_name
  subnet_id3                  = module.dev_vpc.subnet-id3
  az1c                        = "us-east-1c"
}

module "dev_ansible" {
  source                 = "../../modules/ansible_node"
  vpc_security_group_ids = [module.dev_security_group.AnsibleSG]
  subnet_id              = module.dev_vpc.subnet-id2
  availability_zone      = "us-east-1b"
  key_name               = module.dev_keypair.key_name
}

module "dev_lb_cluster" {
  source                      = "../../modules/lb_cluster"
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.medium"
  vpc_security_group_ids      = module.dev_security_group.allSG
  associate_public_ip_address = true
  key_name                    = module.dev_keypair.key_name
  subnet_id                   = module.dev_vpc.subnet-id1
  az1                         = "us-east-1a"
}

module "dev_loadbalancer" {
  source                 = "../../modules/loadbalancer"
  vpc_name               = module.dev_vpc.vpc-id
  vpc_security_group_ids = [module.dev_security_group.allSG]
  subnet_id1              = [module.dev_vpc.subnet-id1, module.dev_vpc.subnet-id2, module.dev_vpc.subnet-id3]
  Worker1_node           = module.dev_worker1-node.Worker1_node_ID
  Worker2_node           = module.dev_worker2-node.Worker2_node_ID
  Worker3_node           = module.dev_worker3-node.Worker3_node_ID
}

# module "dev_route53" {
#   source      = "../../modules/route53"
#   domain_name = "teemone.xyz"
#   dns_name    = module.dev_loadbalancer.Load_Balancer_dns
#   zone_id     = module.dev_loadbalancer.Load_Balancer_zone_id
# }
