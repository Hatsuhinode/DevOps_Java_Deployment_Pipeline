variable "aws_region" {
    description = "Region to deploy and manage AWS resources"
    type = string
  
}


#variable "myvpc_cidr" {
#    description = "Range of IP addresses for the VPC"
#    type = string
#  
#}


variable "myvpc_name" {
    description = "Name of VPC to be created"
    type = string
  
}


#variable "mysubnet_cidr" {
#    description = "Range of IP addresses for the subnet"
#    type = string  
#}


#variable "mysubnet_availabilityZone" {
#    description = "Availability zone for creating subnet"
#    type = string
#  
#}


variable "mysubnet_name" {
    description = "Name of VPC to be created"
    type = string  
}


#variable "igw_name" {
#    description = "Name for the internet gateway attached to the VPC"
#    type = string  
#}


#variable "destination_cidr" {
#    description = "Destination CIDR block for the route used for directing traffic intended for the internet from within the VPC"
#    type = string  
#}


variable "ami_type" {
    description = "Amazon Machine Image(AMI) type"
    type = string  
}


variable "Key_Name" {
    description = "Name for the key to connect to ec2 instance"
    type = string  
}


variable "Public_Key_Path" {
    description = "Path to the public key that is to be associated to AWS instance"
    type = string  
}


variable "ec2Instance_type" {
    description = "Instance type"
    type = string    
}

variable "instanceName" {
    description = "Name of EC2 Instance"
    type = string
  
}


variable "Private_Key_Path" {
    description = "Path to the private key used to connect to AWS instance"
    type = string  
}


variable "my-EBS-size" {
    description = "Size of EBS to be attached to the EC2 instance"
    type = string  
}


variable "my-EBS-name" {
    description = "Name of Elastic Block Store (EBS) attached to the EC2 instance"
    type = string
  
}


variable "volume-path-in-instance-file-sys" {
    description = "The path at which the volume will appear on the instance's file system."
    type = string
    default = "/dev/sdf"
  
}
  

variable "myebs_availabilityZone" {
    description = "Availability zone for creating EBS"
    type = string
  
}