variable "image_id" {
    type = string
    default = "ami-090252cbe067a9e58"
    # if we comment out the default value of image id, it will prompt us while running tf paln.we nee dto enter it amnually
    # briefly describe the purpose of each variable using the optional description argument
    description = "RHEL-9 AMI ID"
}

variable "instance_name" {
    default = "frontend"
}

