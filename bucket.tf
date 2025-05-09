resource "aws_s3_bucket" "backend_bucket" {
    bucket = "my-tf-bucket12335644"
   
    tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}