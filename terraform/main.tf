terraform {
  backend "s3" {
	bucket     	= "terraform-state-logicmonitor"
	key        	= "s3://terraform-state-logicmonitor/statefile.tfstate"
	region     	= "us-east-1"
	encrypt    	= true
	dynamodb_table = "mycomponents_tf_lockid"
  }
}
