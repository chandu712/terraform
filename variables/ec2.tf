# Terraform will start execution from here. Before creating c2 instance, Terraform will create security group first and 
# then the id generated will be fetched and stored in the list of security group vpc_security_group_ids

resource "aws_instance" "db" {
  ami = var.image_id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type = var.instance_type
  # left side things are called arguments, right side are values
  # we can specify a value to an argument directly or refer a variable
  tags = var.tags

}
resource "aws_security_group" "allow_ssh"{
    name = var.sg_name
    description = var.sg_description


# this is not a map, map has key and value.It is called a block
  ingress {
      from_port        = var.ssh_port
      to_port          = var.ssh_port
      protocol         = var.protocol
      cidr_blocks      = var.allowed_cidr
    }
    
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = var.allowed_cidr
    }

  tags = {
        Name = "allow_ssh"
        CreatedBy = "Chandana"
    }
}

