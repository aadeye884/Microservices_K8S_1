#Create load balancer node
resource "aws_instance" "loadbal_node" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id1
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  key_name                    = var.key_name

  tags = {
    Name = "loadbal_node"
  }
}