# Create load balancer node
resource "aws_instance" "lb_cluster" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = var.subnet_id
  availability_zone           = var.az1
  key_name                    = var.key_name
  user_data = <<-EOF
#!/bin/bash
sudo -i
apt-get update -y
apt-get upgrade -y
apt install --no-install-recommends software-properties-common
add-apt-repository ppa:vbertnat/haproxy-2.4 -y
apt install haproxy=2.4.\* -y
cat <<EOT>> /etc/haproxy/haproxy.cfg
frontend fe-apiserver
   bind 0.0.0.0:6443
   mode tcp
   option tcplog
   default_backend be-apiserver
backend be-apiserver
   mode tcp
   option tcplog
   option tcp-check
   balance roundrobin

   server Master1
   server Master2
   server Master3
EOT
sudo hostnamectl set-hostname lb-cluster
EOF
  tags = {
    Name = "lb_cluster"
  }
}