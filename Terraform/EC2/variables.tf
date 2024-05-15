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


variable "Private_Key_Path1" {
    description = "Path to the private key used to connect to AWS instance"
    type = string  
}


variable "my-EBS-size1" {
    description = "Size of EBS to be attached to the EC2 instance"
    type = string  
}


variable "my-EBS-name1" {
    description = "Name of Elastic Block Store (EBS) attached to the EC2 instance"
    type = string
  
}


variable "volume-path-in-instance-file-sys1" {
    description = "The path at which the volume will appear on the instance's file system."
    type = string
    default = "/dev/sdf"
  
}


# /dev/: This is the directory in Unix-like operating systems \
# where device files are stored. \
# These device files represent various hardware devices, \
#including hard drives, partitions, and other storage devices.


# sdf: This part of the device name indicates the specific device identifier. \
# In this case, sd typically refers to a SCSI (Small Computer System Interface) disk device, \
# and f represents the order in which the device was attached. \
# For example, if you attach multiple EBS volumes to an instance, they might be named /dev/sdf, /dev/sdg, /dev/sdh, and so on.


# NOTE:
# If you specify device_name = "/dev/sdf" in your Terraform configuration, \
# the volume will be attached to the EC2 instance and \ 
# accessible within the instance as /dev/xvdf (For Linux instances).

# Thus,
# When you attach an EBS volume to an EC2 instance, \
# it will be accessible within the instance as a block storage device. 
# However, the device name within the instance may not directly correspond to \
#the name you specified when attaching the volume i.e "/dev/sdf".


variable "myebs_availabilityZone1" {
    description = "Availability zone for creating EBS"
    type = string
  
}