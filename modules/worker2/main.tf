#Create Worker2 node
resource "aws_instance" "Worker2_node" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id2
  availability_zone      = var.az1b
  key_name               = var.key_name
  vpc_security_group_ids = [var.vpc_security_group_ids]
  associate_public_ip_address = var.associate_public_ip_address
  user_data = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo hostnamectl set-hostname worker2
  EOF

  tags = {
      Name = "Worker2_node"
  }
}