variable "ami" {
  default = ""
}
variable "instance_type" {
  default = "t2.medium"
}
variable "subnet_id1" {
  default = "PUB_SN1"
}
variable "subnet_id2" {
  default = "PUB_SN2"
}
variable "az1a"{
    default = "us-east-1a"
}
variable "az1b"{
    default = "us-east-1b"
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