terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}



provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test_instance" {
  ami           = "ami-0f496107db66676ff"
  instance_type = "t2.micro"
  tags = {
    Name = "test_instance1"
  }
}
