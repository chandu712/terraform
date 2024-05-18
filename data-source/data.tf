data "aws_ami" "ami_id" {

    most_recent = true
    owners = ["973714476881"]

    filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
    }
 
    filter {
    name   = "root-device-type"
    values = ["ebs"]
    }

    # If we want we can add more and more filters to fetch the desired result
}

data "aws_vpc" "default"{
    default = true
    # us-east -1 default vpc details will be exported/fetched
}



# Data sources allow Terraform to use information defined outside of Terraform
# A data source is accessed via a special kind of resource known as a data resource, declared using a data block: