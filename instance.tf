provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2inst" {
    ami = "ami-084568db4383264d4"
    key_name = "vir-key"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["secGroup"]
    tags = {
      Name = "First-instance"
    }
}