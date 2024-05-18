# Terraform will start execution from here. Before creating ec2 instance, Terraform will create security group first and 
# then the id generated will be fetched and stored in the list of security group vpc_security_group_ids

/* merge takes an arbitrary number of maps or objects, and returns a single map
 or object that contains a merged set of elements from all arguments.

If more than one given map or object defines the same key or attribute, then the one that is later in the argument 
sequence takes precedence  */

resource "aws_instance" "expense" {
  count = length(var.instance_names)
  ami = var.image_id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type = var.instance_names[count.index] == "db" ? "t3.small" : "t3.micro"
  
  tags = merge(
    var.common_tags,
    {
      Name= var.instance_names[count.index]
      Module = var.instance_names[count.index]
    }
  )

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

