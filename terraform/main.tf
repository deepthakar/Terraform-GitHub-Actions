provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "demo" {
  ami         	 = "ami-0f496107db66676ff"
  instance_type = "t2.micro"
}



terraform {
  backend "s3" {
	bucket     	= "terraform-state-logicmonitor"
	key        	= "s3://terraform-state-logicmonitor/statefile.tfstate"
	region     	= "us-east-1"
	encrypt    	= true
	dynamodb_table = "mycomponents_tf_lockid"
  }
}
