# create vpc
resource "aws_vpc" "VPC" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

# create public subnet 1
resource "aws_subnet" "PUB_SN1" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.PUB_SN1_cidr
  availability_zone = var.az2a
  tags = {
    Name = var.pub_subn1
  }
}

# create public subnet 2
resource "aws_subnet" "PUB_SN2" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.PUB_SN2_cidr
  availability_zone = var.az2b
  tags = {
    Name = var.pub_subn2
  }
}


# create an IGW
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.VPC.id

  tags = {
    Name = var.igw_name
  }
}


# create a public route table
resource "aws_route_table" "RT_Pub_SN" {
  vpc_id = aws_vpc.VPC.id

  route {
    cidr_block = var.my_system2
    gateway_id = aws_internet_gateway.IGW.id
  }
  tags = {
    Name = var.route_pub_table
  }
}

# association of route table to public SN 1 
resource "aws_route_table_association" "Public_RT_ass_01" {
  subnet_id      = aws_subnet.PUB_SN1.id
  route_table_id = aws_route_table.RT_Pub_SN.id
}

# association of route table to Public SN 2
resource "aws_route_table_association" "Public_RT_ass_02" {
  subnet_id      = aws_subnet.PUB_SN2.id
  route_table_id = aws_route_table.RT_Pub_SN.id
}