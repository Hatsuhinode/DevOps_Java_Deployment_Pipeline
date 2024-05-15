variable "aws_region1" {
    description = "Region to deploy and manage AWS resources"
    type = string

}


variable "myvpc_cidr1" {
    description = "Range of IP addresses for the VPC"
    type = string
  
}


variable "myvpc_name1" {
    description = "Name of VPC to be created"
    type = string
  
}


variable "mysubnet_cidr1" {
    description = "Range of IP addresses for the subnet"
    type = string
  
}


variable "mysubnet_availabilityZone1" {
    description = "Availability zone for creating subnet"
    type = string

  
}


variable "mysubnet_name1" {
    description = "Name of VPC to be created"
    type = string
  
}


variable "igw_name1" {
    description = "Name for the internet gateway attached to the VPC"
    type = string
  
}


variable "destination_cidr1" {
    description = "Destination CIDR block for the route used for directing traffic intended for the internet from within the VPC"
    type = string
  
}


variable "ami_type1" {
    description = "Amazon Machine Image(AMI) type"
    type = string
  
}


variable "Key_Name1" {
    description = "Name for the key to connect to ec2 instance"
    type = string
    
  
}


variable "Public_Key_Path1" {
    description = "Path to the public key that is to be associated to AWS instance"
    type = string
    
  
}


variable "ec2Instance_type1" {
    description = "Instance type"
    type = string
    
}


variable "instanceName1" {
    description = "Name of EC2 Instance"
    type = string
    
}



