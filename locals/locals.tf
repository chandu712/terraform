locals {
    ami_id = "ami-090252cbe067a9e58"
    sg_id = "sg-0157b9c9177684d5d" # replace with security group id
    # instance_type = "t3.micro"
    instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro"
    tags = {
        Name = "locals"
    }
}