# provider block
provider "aws" {
  profile = "default"
  region = "us-east-1"
}

# resource block
resource "aws_instance" "this" {
  ami                     = "ami-0dcc1e21636832c5d"
  instance_type           = var.ec2_instance_type
  
  tags = {
    Name = var.instance_name
  }
}
# need to have aws cli
# terraform init
# terraform apply 
# applies changes to cloud and creates .tfstate file of the current state of the cloud 
# terraform destroy 
# destroys all the resources created by terraform
# terraform apply -var "instance_name=newName" ...
# or write all the var in terraform.tfvars file with key and values to chane it
