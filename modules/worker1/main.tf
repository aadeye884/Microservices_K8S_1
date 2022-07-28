# Create Worker1 node
resource "aws_instance" "Worker1_node" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id1
  availability_zone      = var.az1a
  key_name               = var.key_name
  vpc_security_group_ids = [var.vpc_security_group_ids]
  associate_public_ip_address = var.associate_public_ip_address
  user_data = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo hostnamectl set-hostname worker1
  EOF
  
  tags = {
    Name = "Worker1_node"
  }
}