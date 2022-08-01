variable "my_system" {
    default = ["0.0.0.0/0"]
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
  default     = ""
}

variable "sg_name2" {
  default     = ""
}

variable "vpc_id" {
  default     = ""
}

variable "port_ssh" {
  default     = 22
  description = "this port allows ssh access"
}

variable "port_http" {
  default     = 80
  description = "this port allows http access"
}