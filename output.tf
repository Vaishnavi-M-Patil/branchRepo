output "aws_instance" {
  value = aws_instance.pubInst.public_ip
}

output "aws_s3_bucket_name" {
    value = aws_s3_bucket.buckets3.bucket
}
