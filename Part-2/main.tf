resource "aws_s3_bucket" "app_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_policy" "app_bucket_policy" {
  bucket = aws_s3_bucket.app_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.app_bucket.arn}/*"
      }
    ]
  })
}


# IAM Role

resource "aws_iam_role" "app_role" {
  name = "app-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "app_policy" {
  name = "app-policy"
  role = aws_iam_role.app_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:*"
        Resource = "${aws_s3_bucket.app_bucket.arn}/*"
      }
    ]
  })
}


# SG

resource "aws_security_group" "existing_sg" {
  name        = "app-sg"
  description = "Allow SSH and HTTP access"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance

resource "aws_instance" "app_instance" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [
    aws_security_group.app_sg.name
  ]

  iam_instance_profile = aws_iam_instance_profile.app_profile.id

  user_data = file("userdata.sh")

  tags = {
    Name = "One2n-Assignment"
  }
}


