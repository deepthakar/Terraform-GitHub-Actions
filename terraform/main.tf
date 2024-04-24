# main.tf
provider "aws" {
  region = "us-east-1"
}
terraform {
 backend "s3" {
	bucket     	= "terraform-state-logicmonitor"
	key        	= "./terraform.tfstate"
	region     	= "us-east-1"
	encrypt    	= true
	dynamodb_table = "mycomponents_tf_lockid"
  }
}
resource "aws_instance" "demo" {
  ami       	 = "ami-0f496107db66676ff"
  instance_type = "t2.micro"
  tags = {
	Name = "DemoEC2Instance1"
  }
}
