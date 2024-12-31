variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "bucket_name" {
  default = "list-bucket-content"
  description = "Name of the S3 bucket"
}

variable "key_name" {
  default = "practice"
  description = "Name of the EC2 key pair for SSH access"
}

variable "allowed_ips" {
  description = "List of allowed IPs for SSH and HTTP access"
  default     = ["0.0.0.0/0"]
}

variable "vpc_id" {
  default = "vpc-016dc1e3b6986c5a7"
}