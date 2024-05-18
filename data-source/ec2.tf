resource "aws_instance" "db" {

    ami = data.aws_ami.ami_id.id
    vpc_security_group_ids = [ "sg-0157b9c9177684d5d" ]
    instance_type = "t3.micro"
    tags = {
        name = "data-source-practice"
        
    }
}