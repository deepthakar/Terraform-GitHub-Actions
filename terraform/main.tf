terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "terraform-state-logicmonitor"
    region = "us-east-1"
    key    = "s3://terraform-state-logicmonitor/terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test_instance" {
  ami           = "ami-0f496107db66676ff"
  instance_type = "t2.nano"
  tags = {
    Name = "test_instance1"
  }
}
