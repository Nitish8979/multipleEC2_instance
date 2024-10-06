terraform {
required_providers{
    aws= {
    source = "hashicorp/aws"
    version = "~> 4.16"
}
}

   required_version = ">= 1.2.0"
}
provider "aws"{
region = "us-east-1"
}

locals {
       instance_names= {"nitish":"ami-0fff1b9a61dec8a5f","devendra":"ami-0866a3c8686eaeeba","shambhu":"ami-0866a3c8686eaeeba"}
}

resource "aws_instance" "aws_ec2_test" {
     for_each = local.instance_names
    ami=each.value
    instance_type = "t3.micro"
    tags ={
    Name = each.key
}
}
