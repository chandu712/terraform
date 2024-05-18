# The variable declaration can also include a default argument. If present, the variable is considered to be optional 
#  and the default value will be used if no value is set when calling the module or running Terraform
# The type argument in a variable block allows you to restrict the type of value that will be accepted as the value for a variable. 
# If no type constraint is set then a value of any type is accepted and they allow Terraform to return a helpful error message 
# if the wrong type is used.

# briefly describe the purpose of each variable using the optional description argument
# all arguments are optional on variable declaration


variable "instance_names" {
    type = list
    default = ["db", "backend", "frontend"]
}

variable "image_id" {
    type = string
    default = "ami-090252cbe067a9e58"
    # if we comment out the default value of image id, it will prompt us while running tf plan.we need to enter it manually
    # briefly describe the purpose of each variable using the optional description argument
    description = "RHEL-9 AMI ID"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

# few tags are common for all instance_names

variable "common_tags" {
    default = {
        Project = "Expense"
        Environment = "Dev"
        Terraform = "true"
    }
}

variable "sg_name" {
    default = "allow_ssh"
}

variable "sg_description" {
    default = "allowing port 22/SSH access"
}

variable "ssh_port" {
    default = 22
}
variable "protocol" {
    default = "tcp"
}

variable "allowed_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}