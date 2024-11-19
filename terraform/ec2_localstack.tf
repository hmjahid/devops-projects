provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  endpoints {
    ec2 = "http://localhost:4566"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  tags = {
    Name = "SimulatedEC2"
  }

  user_data = <<-EOF
              #!/bin/bash
              echo "Simulated EC2 instance initialization" > /tmp/init.log
              EOF
}
