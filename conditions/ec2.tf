resource "aws_instance" "db" {
  ami = var.image_id
  instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro"
  
  # if instance_name is equal to "db" , t3.small will be instance_type, otherwise it will be "t3.micro"

  # left side things are called arguments, right side are values
  # we can specify a value to an argument directly or refer a variable
  # if security group is not given, it will take default security group

}