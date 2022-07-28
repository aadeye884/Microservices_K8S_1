# Create Kubernetes Security Group
resource "aws_security_group" "allSG" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "all traffic from VPC"
    from_port   = var.port_all_from
    to_port     = var.port_all_to
    protocol    = "tcp"
    cidr_blocks = var.my_system
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.my_system
  }

  tags = {
    Name = var.sg_name
  }
}