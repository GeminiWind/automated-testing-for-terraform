provider "aws" {
  region = var.aws_region
}

# website::tag::1:: Deploy an EC2 Instance.
resource "aws_instance" "example" {
  # website::tag::2:: Run an Ubuntu 18.04 AMI on the EC2 instance.
  ami                    = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.instance.id]

  # website::tag::3:: When the instance boots, start a web server on port 80 that responds with "Hello, World!".
  user_data = <<EOF
#!/bin/bash
echo "Hello, World!" > index.html
nohup busybox httpd -f -p 80 &
EOF
}

# website::tag::4:: Allow the instance to receive requests on port 80.
resource "aws_security_group" "instance" {
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}