# Create Master Server  (using Ubuntu for ami and t3.medium for instance type)
resource "aws_instance" "UST1_Master_node3" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = var.subnet_id3
  availability_zone           = var.az3
  key_name                    = var.key_name
  user_data = <<-EOF
#!/bin/bash
sudo apt update -y
sudo bash -c "cat <<EOIPFW >> /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOIPFW"
sudo modprobe overlay
sudo modprobe br_netfilter
sudo modprobe overlay
sudo modprobe br_netfilter
sudo bash -c "cat <<EOIPFW >> /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOIPFW"
sudo sysctl --system
sudo apt-get update && sudo apt-get install -y containerd
sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml
sudo systemctl restart containerd
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo bash -c "cat <<EOIPFW >> /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOIPFW"
sudo apt-get update
sudo apt-get update
sudo apt-get install -y kubelet=1.20.1-00 kubeadm=1.20.1-00 kubectl=1.20.1-00
sudo apt-mark hold kubelet kubeadm kubectl
sudo hostnamectl set-hostname master3
  EOF
  tags = {
    Name = "UST1_Master_node3"
  }
}