# Create Master Server  (using Ubuntu for ami and t3.medium for instance type)
resource "aws_instance" "UST1_Master_node" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = var.subnet_id
  availability_zone           = var.az1
  key_name                    = var.key_name
  user_data = <<-EOF
  #!/bin/bash
  sudo apt update -y 
  sudo hostnamectl set-hostname master
  EOF
  tags = {
    Name = "UST1_Master_node"
  }
}