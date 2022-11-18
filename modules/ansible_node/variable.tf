variable "instance_type" {
    default = ""
}

variable "ami" {
    default = "ami-052efd3df9dad4825"
}

variable "subnet_id" {
    default = ""
}

variable "availability_zone" {
    default = "us-east-1a"
}

variable "key_name" {
    default = ""
}
variable "vpc_security_group_ids" {
    default = ""
}
variable "associate_public_ip_address" {
  default = true
}
variable "join-gen_yml" {
  default = "~/allmyproject/Sock-Shop-Microservices-Kubernetes-Project-US-Team-1-18JULY/modules/ansible_node/join-gen.yml"
}
variable "join_yml" {
  default = "~/allmyproject/Sock-Shop-Microservices-Kubernetes-Project-US-Team-1-18JULY/modules/ansible_node/join.yml"
}
variable "deployment_yml" {
  default = "~/allmyproject/Sock-Shop-Microservices-Kubernetes-Project-US-Team-1-18JULY/modules/ansible_node/deployment.yml"
}
variable "monitoring_yml" {
  default = "~/allmyproject/Sock-Shop-Microservices-Kubernetes-Project-US-Team-1-18JULY/modules/ansible_node/monitoring.yml"
}
variable "keypair" {
  default = "~/Downloads/keypairs/USTeam1Keypair"
}

