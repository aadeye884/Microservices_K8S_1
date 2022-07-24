variable "public_key" {
  default     = "~/cloud_devops/SockShop_Microservices_KB/sock_key.pub"
  description = "path to my pub key"
}
variable "key_name" {
  default = "sock_key"
}
variable "ami" {
  default = "ami-06640050dc3f556bb"
}
variable "instance_type" {
  default = "t2.medium"
}
variable "vpc_name" {
  default = "vpc"
}
variable "vpc_cidr_block" {
  default     = "10.0.0.0/16"
  description = "custom VPC cidr block"
}
variable "public_subnet_n1" {
  default = "public_subnet1"
}
variable "public_subnet_n2" {
  default = "public_subnet2"
}
variable "public_subnet1_cidr_block" {
  default     = "10.0.0.0/24"
  description = "public subnet1 cidr block"
}
variable "public_subnet2_cidr_block" {
  default     = "10.0.1.0/24"
  description = "public subnet2 cidr block"
}
variable "az_1" {
  default = "us-east-1a"
}
variable "az_2" {
  default = "us-east-1b"
}
variable "IGW" {
  default = "internet_gateway"
}
variable "public_routetable" {
  default = "public_rt"
}
variable "publicroute_cidr" {
  default = "0.0.0.0/0"
}
variable "my_system" {
  default     = ["0.0.0.0/0"]
  description = "this cidr block is open to the world"
}
variable "port_all_from" {
  default     = 0
  description = "this port allows ssh access"
}
variable "port_all_to" {
  default     = 65535
  description = "this port allows http access"
}
variable "sg_name" {
  default = ""
}
variable "vpc_id" {
  default = ""
}
variable "vpc_security_group_ids" {
  default = ""
}
variable "associate_public_ip_address" {
  default = true
}