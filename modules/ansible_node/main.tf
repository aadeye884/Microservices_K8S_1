# Create Ansible Server  (using Red Hat for ami and t2.micro for instance type)
resource "aws_instance" "Ansible_node" {
  ami                         = var.ami
  instance_type               = var.instance_type_t2
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  availability_zone           = var.availability_zone
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  user_data = <<-EOF
#!/bin/bash
sudo hostnamectl set-hostname ansible
sudo apt update -y
sudo apt-get upgrade -y
sudo apt install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
sudo apt install sshpass
sudo chown -R ubuntu:ubuntu /etc/ansible && chmod +x /etc/ansible
cd /etc/ansible
touch installation.yaml
touch cluster.yaml
touch join.yaml
touch monitoring.yaml
touch deployment.yaml
su - ubuntu -c "ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''"
EOF

  tags = {
    Name = "Ansible_node"
  }
}