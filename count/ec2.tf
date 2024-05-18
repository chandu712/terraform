# we can create multiple instances without using 'count' as below.This is tedious job

/*  resource "aws_instance" "db" {
  ami                     = "ami-090252cbe067a9e58"

  instance_type = "t3.micro"

  tags = {
    Name = "db"
  }

}

resource "aws_instance" "backend" {
  ami                     = "ami-090252cbe067a9e58"
  
  instance_type = "t3.micro"

  tags = {
    Name = "backend"
  }

}

resource "aws_instance" "frontend" {
  ami                     = "ami-090252cbe067a9e58"
  
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }

}  */

# by using count argument, disadvantage with this approach is 3 instances will be created with name "db"
/* The count meta-argument accepts a whole number, and creates that many instances of the resource or module. Each instance has 
a distinct infrastructure object associated with it, 
and each is separately created, updated, or destroyed when the configuration is applied.  

In blocks where count is set, an additional count object is available in expressions, so you can modify the configuration of 
each instance. This object has one attribute: Terraform givs us a vraiable called count.index

count.index — The distinct index number (starting with 0) corresponding to this instance.  */

/* loops
1. count based loops  --> count.index , during first iteration the value will be o, next iteraton ,it's value will be 1 and so on..

2. for loops
3. dynamic block loop 

Functions:

The Terraform language does not support user-defined functions
The Terraform language includes a number of built-in functions that you can call 
from within expressions to transform and combine values   */



 resource "aws_instance" "db" {
  # count = 3
  count = length(var.instance_names)   # using functions to get the length of a list variable
  ami                     = "ami-090252cbe067a9e58"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type = "t3.micro"

  tags = {
    Name = var.instance_names[count.index]

    # in first iteration, the element in index 0 will be db.
  }

}

resource "aws_security_group" "allow_ssh"{
    name = "allow_ssh"
    description = "allowing SSH access"

  ingress {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
    
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }



    tags = {
        Name = "allow_ssh"
        CreatedBy = "Chandana"
    }
}  