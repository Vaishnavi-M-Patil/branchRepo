resource "aws_vpc" "myVpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      name = "spiderman_vpc"
    }
}

resource "aws_subnet" "pvt_subnet" {
    cidr_block = "10.0.0.0/25"
    vpc_id = aws_vpc.myVpc.id
    map_public_ip_on_launch = false
    tags = {
      name = "private_subnet"
      env = "development"
    }
}

resource "aws_subnet" "pub_subnet" {
    cidr_block = "10.0.0.128/25"
    vpc_id = aws_vpc.myVpc.id
    map_public_ip_on_launch = true
    tags = {
      name = "public_subnet"
      env = "development"
    }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myVpc.id
}

resource "aws_route_table" "myroute" {
  vpc_id = aws_vpc.myVpc.id
  tags = {
    name = "myvpc-route-table"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
}

resource "aws_route_table_association" "subnet_asso" {
  subnet_id = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.myroute.id
}

resource "aws_security_group" "newSecuritygrp" {
  name = "newSecGroup"
  vpc_id = aws_vpc.myVpc.id
  tags = {
    name = "myVpc-security-group"
  }
  ingress {
    description = "HTTP"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]    
  }
  ingress {
    description = "SSH"
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]    
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"              # -1 means all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}