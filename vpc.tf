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
    cidr_block = "10.0.0.348/25"
    vpc_id = aws_vpc.myVpc.id
    map_public_ip_on_launch = true
    tags = {
      name = "public_subnet"
      env = "development"
    }
}

