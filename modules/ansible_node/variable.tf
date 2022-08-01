variable "instance_type_t2" {
    default = "t2.medium"
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