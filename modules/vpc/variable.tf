# VPC related variables 
variable "vpc_cidr" {
    default     = "10.0.0.0/16"
    description = "VPC"
}
variable "PUB_SN1_cidr" {
    default     = "10.0.0.0/24"
    description = "PUB_SN1"
}
variable "PUB_SN2_cidr" {
    default     = "10.0.1.0/24"
    description = "PUB_SN2"
}
variable "az2a"{
    default = "us-east-1a"
}
variable "az2b"{
    default = "us-east-1b"
}
variable "vpc_name" {
    default = "VPC"
}
variable "pub_subn1" {
    default = "PUB_SN1"
}
variable "pub_subn2" {
    default = "PUB_SN2"
}
variable "igw_name" {
    default = "IGW"
}
variable "route_pub_table" {
    default = "RT_Pub_SN"
}
variable "my_system2" {
    default = "0.0.0.0/0"
}