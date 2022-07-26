# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

#Create Public Subnet 01
resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet1_cidr_block
  availability_zone = var.az_1

  tags = {
    Name = var.public_subnet_n1
  }
}

#Create Public Subnet 02
resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet2_cidr_block
  availability_zone = var.az_2

  tags = {
    Name = var.public_subnet_n2
  }
}

#Create internet gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_name
  }
}

#create public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.publicroute_cidr
    gateway_id = aws_internet_gateway.IGW.id
  }
  tags = {
    Name = var.public_routetable
  }
}

#create route table association pub sn1
resource "aws_route_table_association" "public_subnet_rt_as1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_rt.id
}
#create route table association pub sn2
resource "aws_route_table_association" "public_subnet_rt_as2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_rt.id
}

# Create security Group
resource "aws_security_group" "master_host_sg" {
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
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.my_system
  }

  tags = {
    Name = var.sg_name
  }
}

# Create a Keypair
resource "aws_key_pair" "sock_key" {
  key_name   = var.key_name
  public_key = file(var.public_key)
}

#Create Master node01
resource "aws_instance" "master_host" {
  ami                         = var.ami
  instance_type               = var.instance_type
  availability_zone           = var.az_1
  key_name                    = var.key_name
  subnet_id                   = var.public_subnet_n1
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  associate_public_ip_address = var.associate_public_ip_address
  user_data                   = <<-EOF
  #!/bin/bash
  sudo apt update -y 
  sudo hostnamectl set-hostname master
  EOF
  tags = {
    Name = "master_host"
  }
}

#Create Worker Node 1
resource "aws_instance" "worker1_host" {
  ami                         = var.ami
  instance_type               = var.instance_type
  availability_zone           = var.az_1
  key_name                    = var.key_name
  subnet_id                   = var.public_subnet_n1
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  associate_public_ip_address = var.associate_public_ip_address
  user_data                   = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo hostnamectl set-hostname worker1
  EOF
  tags = {
    Name = "worker1_host"
  }
}

#Create Worker Node 2
resource "aws_instance" "worker2_host" {
  ami                         = var.ami
  instance_type               = var.instance_type
  availability_zone           = var.az_1
  key_name                    = var.key_name
  subnet_id                   = var.public_subnet_n2
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  associate_public_ip_address = var.associate_public_ip_address
  user_data                   = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo hostnamectl set-hostname worker2
  EOF
  tags = {
    Name = "worker2_host"
  }
}