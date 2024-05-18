output "ami_id"{

    value = data.aws_ami.ami_id
    # this expression gets the data of aws resorce(AWS_ami)
     
    # value = data.aws_ami.ami_id.id
    # we will get the id of Aws_ami with above expression
}

output "vpc_info" {
    value = data.aws_vpc.default
}