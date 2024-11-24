provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  shared_credentials_files    = ["/dev/null"] 
  endpoints {
    ec2 = "http://localhost:4566"
  }
}

# VPC for EC2 Instance
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# Subnet for EC2 Instance
resource "aws_subnet" "example" {
  vpc_id                  = "vpc-d78a53ab"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# Security Group to allow SSH
resource "aws_security_group" "example" {
  name        = "new-sg"
  vpc_id      = "vpc-d78a53ab"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Key Pair for EC2 Instance (Ensure you have a valid SSH public key at this location)
resource "aws_key_pair" "example" {
  key_name   = "my-key"
  public_key = file("~/.ssh/id_rsa.pub")  # Ensure this is the correct path to your SSH public key
}

# EC2 Instance
resource "aws_instance" "example" {
  ami           = "ami-12345678"  # Replace with a dummy AMI ID for LocalStack
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example.id
  key_name      = aws_key_pair.example.key_name
  security_groups = ["new-sg"]

  depends_on = [
    aws_security_group.example  # This ensures the security group is created before the EC2 instance
  ]

  tags = {
    Name = "TestInstance"
  }
}



# Output for EC2 Instance ID and Key Pair Name
output "instance_id" {
  value = aws_instance.example.id
}

output "key_pair_name" {
  value = aws_key_pair.example.key_name
}
