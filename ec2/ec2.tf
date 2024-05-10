# Terraform will start execution from here. Before creating c2 instance, Terraform will create security group first and 
# then the id generated will be fetched and stored in the list of security group vpc_security_group_ids
resource "aws_instance" "db" {
  ami                     = "ami-090252cbe067a9e58"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type = "t3.micro"

  tags = {
    Name = "db"
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

