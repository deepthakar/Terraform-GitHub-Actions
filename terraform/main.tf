terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket         	   = "terraform-github-actions-state-897"
    key                = "s3://terraform-github-actions-state-897/state/terraform.tfstate"
    region         	   = "us-east-1"
    encrypt        	   = true
    dynamodb_table     = "mycomponents_tf_lockid"
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
