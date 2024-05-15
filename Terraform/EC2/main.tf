module "myEC2instance" {
    source = "../Modules/EC2"

    aws_region = var.aws_region1
    myvpc_cidr = var.myvpc_cidr1
    myvpc_name = var.myvpc_name1
    mysubnet_cidr = var.mysubnet_cidr1
    mysubnet_availabilityZone = var.mysubnet_availabilityZone1
    mysubnet_name = var.mysubnet_name1
    igw_name = var.igw_name1
    destination_cidr = var.destination_cidr1
    instanceName = var.instanceName1
    ami_type = var.ami_type1
    ec2Instance_type = var.ec2Instance_type1
    Key_Name = var.Key_Name1 
    Public_Key_Path = var.Public_Key_Path1

}
