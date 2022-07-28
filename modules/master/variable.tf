variable "ami" {
  default = ""
}

variable "instance_type" {
  default = ""
}

variable "subnet_id" {
  default = "UST1K8s_PubSN1"
}

variable "az1" {
  default = "us-east-1a"
}

variable "key_name" {
  default = "USTeam1Keypair"
}

variable "vpc_security_group_ids" {
  default = ""
}

variable "associate_public_ip_address" {
  default = true
  
}