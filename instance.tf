resource "aws_instance" "ec2inst" {
    ami = "ami-084568db4383264d4"
    key_name = "vir-key"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.pub_subnet.id
    security_groups = ["aws_security_group.newSecuritygrp.id"] 
    tags = {
      Name = "First-instance"
    }
}

resource "aws_instance" "ec2instance" {
    ami = "ami-084568db4383264d4"
    key_name = "vir-key"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.pvt_subnet.id
    vpc_security_group_ids = ["aws_security_group.newSecuritygrp.id"]
    tags = {
      Name = "First-instance"
    }
}