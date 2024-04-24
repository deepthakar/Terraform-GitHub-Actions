terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket         	   = "terraform-state-logicmonitor"
    #key                = "state/terraform.tfstate"
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
  instance_type = "t2.nano"
  tags = {
    Name = "state_test_instance1"
  }
}
