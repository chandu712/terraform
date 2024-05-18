output "public_ip" {
    value = aws_instance.db
}


/* Output values make information about your infrastructure available on the command line
Each output value exported by a module must be declared using an output block:

output "instance_ip_addr" {
  value = aws_instance.server.private_ip
}

The label immediately after the output keyword is the name, which must be a valid identifier.
The value argument takes an expression whose result is to be returned to the user.
 In this example, the expression refers to the private_ip attribute exposed by an aws_instance 
 resource defined elsewhere in this module

Note: Outputs are only rendered when Terraform applies your plan. Running terraform plan will not render outputs.  */

