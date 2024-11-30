# Define the AWS provider
provider "aws" {
  region = "us-east-2"  #region
}

# Create a Security Group
resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "Allow inbound and outbound traffic"

  # Inbound Rules (Allow SSH and HTTP)
  ingress {
    from_port   = 22                # Port 22 for SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]     # Allow from any IP address
  }

  ingress {
    from_port   = 80                # Port 80 for HTTP
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]     # Allow from any IP address
  }

  # Outbound Rules (Allow all traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"              # -1 means all traffic
    cidr_blocks = ["0.0.0.0/0"]     # Allow to any IP address
  }
}

# Create an EC2 instance and attach the security group
resource "aws_instance" "my_instance" {
  ami           = "ami-0ea3c35c5c3284d82"  #  AMI ID
  instance_type = "t2.micro"               # Instance type

  key_name = "my-key-pair"                 #  key pair name
  security_groups = [aws_security_group.my_security_group.name]

  tags = {
    Name = "MyInstance"
  }
}
