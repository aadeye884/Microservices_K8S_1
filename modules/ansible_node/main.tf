# Create Ansible Server  (using Red Hat for ami and t2.micro for instance type)
resource "aws_instance" "Ansible_node" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  availability_zone           = var.availability_zone
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  user_data = <<-EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible -y
sudo chmod -R 700 .ssh/
sudo chown -R ubuntu:ubuntu .ssh/
cd ~/.ssh/
echo "${file(var.keypair)}" >> /.ssh/USTeam1Keypair
chmod 400 USTeam1Keypair
cd ~/etc/ansible
sudo chown -R ubuntu:ubuntu /etc/ansible
sudo touch installation.yml deployment.yml monitoring.yml
echo "${file(var.join-gen_yml)}" >> /etc/ansible/cluster.yml
echo "${file(var.join_yml)}" >> /etc/ansible/join.yml
echo "${file(var.deployment_yml)}" >> /etc/ansible/deployment.yml
echo "${file(var.monitoring_yml)}" >> /etc/ansible/monitoring.yml
echo "[Masters]" >> /etc/ansible/hosts
echo "[Workers]" >> /etc/ansible/hosts
hostnamectl set-hostname Ansible
EOF

  tags = {
    Name = "Ansible_node"
  }
}
