

provider "aws" {
  region = "eu-west-1"
}




resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.3.0.0/16"  
  instance_tenancy = "default"      
  tags = {
    Name = "my_vpc"  
  }
}


resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id  
  cidr_block              = "10.3.0.0/20"      
  availability_zone       = "eu-west-1a"      

  tags = {
    Name = "public_subnet"  
  }
}


resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id  
  cidr_block              = "10.3.16.0/20"     
  availability_zone       = "eu-west-1b"       

  tags = {
    Name = "private_subnet"  
  }
}

