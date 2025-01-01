output "instance_public_ip" {
  value = aws_instance.app_instance.public_ip
}

output "s3_bucket_name" {
  value = data.aws_s3_bucket.app_bucket.bucket
}
